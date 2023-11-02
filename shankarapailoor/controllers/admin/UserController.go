package admin

import (
	"fmt"
	"net/http"
	"os"
	"path"
	"strconv"

	"github.com/shankarapailoor/model"
	"github.com/shankarapailoor/utils"

	"github.com/gin-gonic/gin"
)

type UserController struct {
}

func (con UserController) About(ctx *gin.Context) {
	ctx.HTML(200, "about.html", gin.H{})
}

func (con UserController) Admin(ctx *gin.Context) {
	ctx.HTML(200, "index.html", gin.H{})
}

// 登录逻辑
func (con UserController) Login(ctx *gin.Context) {
	// 获取表单数据
	username := ctx.PostForm("username")
	password := ctx.PostForm("password")
	// 创建User实例
	user := model.User{}
	// 查找数据库是否存在该登录用户
	model.DB.Where("username=? AND password=?", username, password).Find(&user)
	if user.Id > 0 {
		uuid := utils.CreateUUID()
		sess := model.Session{
			SessionId: uuid,
			Username:  user.Username,
			UserId:    user.Id,
		}
		model.DB.Create(&sess)
		ctx.SetCookie("username", sess.SessionId, 3600, "/", "localhost", false, true)
		ctx.JSON(200, gin.H{
			"message": "用户名和密码正确！",
		})
		return
	} else {
		ctx.JSON(200, gin.H{
			"message": "用户名或密码不正确！",
		})
	}
}

func (con UserController) Regist(ctx *gin.Context) {
	username := ctx.PostForm("username")
	email := ctx.PostForm("email")
	password := ctx.PostForm("password")
	user := model.User{
		Username: username,
		Email:    email,
		Password: password,
	}
	//fmt.Println("注册的user=", user)
	model.DB.Create(&user)
	// users := []model.User{}
	// model.DB.Find(&users)
	// fmt.Println(users)
	ctx.JSON(200, gin.H{
		"message": "注册成功！",
	})
}

func (con UserController) Logout(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	fmt.Println("cookie=", cookie)
	if cookie != "" {
		utils.DeleteSession(cookie)
		ctx.SetCookie("username", "", -1, "/", "localhost", false, false)
	}
	ctx.HTML(http.StatusOK, "index01.html", gin.H{})
}

func (con UserController) CheckUserName(ctx *gin.Context) {
	username := ctx.PostForm("username")
	user := model.User{}
	model.DB.Where("username = ?", username).Find(&user)
	if user.Id <= 0 {
		ctx.JSON(200, gin.H{
			"message": "用户名可用！",
		})
		return
	} else {
		ctx.JSON(200, gin.H{
			"message": "<font style='color:red'>用户名已经存在！</font>",
		})
		return
	}
}

func (con UserController) EditUser(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{}
	model.DB.Where("session_id=?", cookie).Find(&sess)
	userId := sess.UserId
	user := model.User{
		Id: userId,
	}
	model.DB.Find(&user)
	users := []model.User{}
	model.DB.Find(&users)

	//fmt.Println("sess=", sess)
	ctx.HTML(200, "contact.html", gin.H{
		"user":  user,
		"users": users,
	})
}

func (con UserController) EditUsername(ctx *gin.Context) {
	username := ctx.PostForm("username")
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{}
	model.DB.Where("session_id=?", cookie).Find(&sess)
	userId := sess.UserId
	user := model.User{}
	model.DB.Exec("UPDATE user SET username = ? WHERE id = ?", username, userId)
	model.DB.Where("id=?", userId).Find(&user)
	//fmt.Println("edit user=", user)
	// ctx.JSON(200, gin.H{
	// 	"message": 111,
	// })
	//moonshine.MoonshineCtroller{}.BackstPre(ctx)
	UserController{}.EditUser(ctx)
}

func (con UserController) EditEmail(ctx *gin.Context) {
	email := ctx.PostForm("email")
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{}
	model.DB.Where("session_id=?", cookie).Find(&sess)
	userId := sess.UserId
	user := model.User{}
	model.DB.Exec("UPDATE user SET email = ? WHERE id = ?", email, userId)
	model.DB.Where("id=?", userId).Find(&user)
	UserController{}.EditUser(ctx)
}

func (con UserController) EditPassword(ctx *gin.Context) {
	password := ctx.PostForm("password")
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{}
	model.DB.Where("session_id=?", cookie).Find(&sess)
	userId := sess.UserId
	user := model.User{}
	model.DB.Exec("UPDATE user SET password = ? WHERE id = ?", password, userId)
	model.DB.Where("id=?", userId).Find(&user)

	UserController{}.Logout(ctx)
}

func (con UserController) EditSrc(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{}
	model.DB.Where("session_id=?", cookie).Find(&sess)
	user := model.User{}
	model.DB.Where("id=?", sess.UserId).Find(&user)

	//fmt.Println("src user=", user)
	src, err := ctx.FormFile("src")
	//mt.Println("打开文件错误=", err)
	if err == nil {
		extName := path.Ext(src.Filename)
		//fmt.Println("extName=", extName)
		allowExtMap := map[string]bool{
			".jpg":  true,
			".png":  true,
			".gif":  true,
			".jpeg": true,
		}
		if _, ok := allowExtMap[extName]; !ok {
			ctx.String(200, "文件类型不合法")
			return
		}
		dir := "./static/img/src"
		if err1 := os.MkdirAll(dir, 0666); err != nil {
			fmt.Println("err1=", err1)
		}
		id := strconv.FormatInt(user.Id, 10)
		fileUnixName := user.Username + id
		//fmt.Println("fileUnixName=", fileUnixName)
		saveDir := path.Join(dir, fileUnixName+extName)
		//fmt.Println("fileUnixName+extName=", fileUnixName+extName)
		ctx.SaveUploadedFile(src, saveDir)
		imgSrc := "/static/img/src/" + fileUnixName + extName
		model.DB.Exec("UPDATE user SET src = ? WHERE id = ?", imgSrc, user.Id)
	}
	UserController{}.EditUser(ctx)

}

func (con UserController) UploadSrc(ctx *gin.Context) {
	// id := ctx.Query("id")
	// id1, _ := strconv.ParseInt(id, 10, 64)
	// username := ctx.PostForm("username")
	// email := ctx.PostForm("email")
	// password := ctx.PostForm("password")
	// src, err := ctx.FormFile("src")

	// user := model.User{}
	// model.DB.Exec("update user set username=? where dis_id=?", mark, disId)

	// if err == nil {
	// 	extName := path.Ext(src.Filename)
	// 	allowExtMap := map[string]bool{
	// 		".jpg":  true,
	// 		".png":  true,
	// 		".gif":  true,
	// 		".jpeg": true,
	// 	}
	// 	if _, ok := allowExtMap[extName]; !ok {
	// 		ctx.String(200, "文件类型不合法")
	// 		return
	// 	}
	// 	dir := "./static/img/src"
	// 	if err1 := os.MkdirAll(dir, 0666); err != nil {
	// 		log.Error(err1)
	// 	}
	// 	fileUnixName := username + id
	// 	saveDir := path.Join(dir, fileUnixName+extName)
	// 	ctx.SaveUploadedFile(src, saveDir)
	// }
	ctx.HTML(200, "forms.html", gin.H{})
}
