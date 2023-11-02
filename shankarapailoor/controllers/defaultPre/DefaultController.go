package defaultPre

import (
	_ "fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/shankarapailoor/model"
)

type DefaultController struct {
}

func (con DefaultController) DefaultPre(ctx *gin.Context) {

	//userList := []model.User{}
	// model.DB.Find(&userList)
	// fmt.Println("数据库获取数据=", userList)

	//查询
	// user := model.User{}
	// model.DB.Where("username = ?", "aa").First(&user)
	// fmt.Println(user)

	//创建
	// user := model.User{
	// 	Username: "cc",
	// 	Password: "cc",
	// 	Email:    "g552277g@163.com",
	// }
	// model.DB.Create(&user)
	// fmt.Println(user)

	//修改数据保存所有字段
	// user := model.User{Id: 1}
	// model.DB.Find(&user)
	// user.Username = "tt"
	// model.DB.Save(&user)
	// fmt.Println(user)

	//更新指定数据
	// user := model.User{}
	// model.DB.Model(&user).Where("id = ?", 1).Update("username", "lqq")

	//常用更新单列写法
	// user := model.User{}
	// model.DB.Where("id = ?", 2).Find(&user)
	// user.Username = "小宝"
	// model.DB.Save(&user)

	//删除
	// user := model.User{Id: 3}
	// model.DB.Delete(&user)

	//原生sql
	// user := model.User{}
	// model.DB.Raw("select * from user where id = ?", 1).Scan(&user)
	// fmt.Println(user)

	ctx.HTML(http.StatusOK, "index01.html", gin.H{})
}
