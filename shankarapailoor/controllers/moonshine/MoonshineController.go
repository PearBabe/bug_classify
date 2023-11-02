package moonshine

import (
	"fmt"
	"net/http"
	"strconv"

	_ "github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/model"
	_ "github.com/shankarapailoor/utils"
)

type MoonshineCtroller struct {
}

func (con MoonshineCtroller) BackstPre(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{
		SessionId: cookie,
	}

	model.DB.Find(&sess)
	fmt.Println("sess=", sess)
	user := model.User{}
	model.DB.Where("id=?", sess.UserId).Find(&user)
	fmt.Println("user=", user)
	ctx.HTML(http.StatusOK, "manage.html", gin.H{
		"username": user.Username,
		"id":       user.Id,
		"src":      user.Src,
		"message":  "操作成功",
	})
}

func (con MoonshineCtroller) IframeSelect(ctx *gin.Context) {
	id := ctx.Query("id")
	//fmt.Println("获得的id=", id)
	ctx.HTML(http.StatusOK, "fuzz.html", gin.H{
		"id": id,
	})
}

func (con MoonshineCtroller) AddMark(ctx *gin.Context) {
	id1 := ctx.Query("disId")
	//fmt.Println(id1)
	disId, _ := strconv.ParseInt(id1, 10, 64)
	//fmt.Println("dis_id=", disId)
	// disres := model.Disres{
	// 	DisId: disId,
	// }
	mark := ctx.PostForm("mark")
	//disres := model.Disres{}
	model.DB.Exec("update disres set remark=? where dis_id=?", mark, disId)
	// user := model.User{}
	// model.DB.Raw("select * from user where id = ?", 1).Scan(&user)
	// fmt.Println(user)
	//model.DB.Model(&disres).Update("remark", ctx.PostForm("mark"))
}

func (con MoonshineCtroller) FuzzList(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{
		SessionId: cookie,
	}
	model.DB.Find(&sess)
	user := model.User{}
	model.DB.Where("id=?", sess.UserId).Find(&user)

	disres := []model.Disres{}
	model.DB.Raw("SELECT dis_id,SUBSTR(dis_result,1,40) as dis_result,user_id,distill,date,remark FROM disres").Scan(&disres)
	// users := []model.User{}
	// model.DB.Find(&users)
	//fmt.Println("disres=", disres)
	fuzzList := []model.FuzzList{}
	for _, v := range disres {
		fmt.Println("v=", v)
		id := v.UserId
		//fmt.Println("userid=", v.UserId)
		user1 := model.User{}
		model.DB.Where("id=?", id).Find(&user1)
		//fmt.Println("user=", user1)
		imgSrc := user1.Src
		userName := user1.Username
		fuzz := model.FuzzList{
			Disres:   v,
			UserName: userName,
			Src:      imgSrc,
		}
		fmt.Println("fuzz=", fuzz)
		fuzzList = append(fuzzList, fuzz)
	}
	fmt.Println("fuzzlist=", fuzzList)
	ctx.HTML(http.StatusOK, "expenses.html", gin.H{
		"fuzzList": fuzzList,
	})
}

func (con MoonshineCtroller) PerFuzzList(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{
		SessionId: cookie,
	}
	model.DB.Find(&sess)
	user := model.User{}
	model.DB.Where("id=?", sess.UserId).Find(&user)

	disres := []model.Disres{}
	model.DB.Where("user_id=?", user.Id).Find(&disres)

	fuzz := []model.FuzzList{}
	perFuzz := []model.PerFuzzList{}

	disresrec := []model.Disresrec{}
	for _, v := range disres {
		i := v.DisId
		dis := model.Disresrec{}
		model.DB.Where("dis_id=?", i).Find(&dis)
		disresrec = append(disresrec, dis)

		fu := model.FuzzList{
			Disres:   v,
			UserName: user.Username,
			Src:      user.Src,
		}
		fuzz = append(fuzz, fu)

		per := model.PerFuzzList{
			Disres:    v,
			Disresrec: dis,
			UserName:  user.Username,
			Src:       user.Src,
		}
		perFuzz = append(perFuzz, per)
	}

	ctx.HTML(200, "department.html", gin.H{
		"fuzzList":  fuzz,
		"perFuzz":   perFuzz,
		"disresrec": disres,
		"img":       user.Src,
		"username":  user.Username,
	})
}

func (con MoonshineCtroller) EditRemark(ctx *gin.Context) {
	remark := ctx.PostForm("mark")
	disId := ctx.PostForm("id")
	// fmt.Println("disid=", disId, " remark=", remark)

	model.DB.Exec("UPDATE disres SET remark = ? WHERE dis_id = ?", remark, disId)
	disres := model.Disres{}
	model.DB.Where("dis_id=?", disId).Find(&disres)
	MoonshineCtroller{}.PerFuzzList(ctx)
}

func (con MoonshineCtroller) GetRemarkByDisId(ctx *gin.Context) {
	disId := ctx.Query("id")
	fmt.Println("id=", disId)
	disres := model.Disres{}
	model.DB.Where("dis_id=?", disId).Find(&disres)
	ctx.JSON(200, gin.H{
		"disres": disres,
	})
}

func (con MoonshineCtroller) DeleteDisres(ctx *gin.Context) {
	disId := ctx.Query("id")
	disres := model.Disres{}
	disresrec := model.Disresrec{}
	model.DB.Where("dis_id=?", disId).Delete(&disres)
	model.DB.Where("dis_id=?", disId).Delete(&disresrec)
	MoonshineCtroller{}.PerFuzzList(ctx)
}

func (con MoonshineCtroller) ResultSta(ctx *gin.Context) {
	result := []model.Result{}
	model.DB.Find(&result)
	//fmt.Println("result=", result)
	seedsTotal := result[0].SeedsTotal
	filesTotal := result[0].FilesTotal
	ctx.HTML(200, "table.html", gin.H{
		"result":     result,
		"seedsTotal": seedsTotal,
		"filesTotal": filesTotal,
	})
}

func (con MoonshineCtroller) SyzkallerConfig(ctx *gin.Context) {
	cookie, _ := ctx.Cookie("username")
	sess := model.Session{
		SessionId: cookie,
	}
	model.DB.Find(&sess)
	user := model.User{}
	model.DB.Where("id=?", sess.UserId).Find(&user)

	bugPre := []model.BugPre{}
	// classify := []model.Classifybug{}
	// class02 :=[]model.Classifybug{}
	// model.DB.Where("user_id=?",user.Id).Find(&class02)

	rows, err := model.DB.Raw("SELECT SUBSTR(bug_report,1,15) as bug_simple,bug_report,user_id,id,date,predict_bug FROM classifybug WHERE user_id=?", user.Id).Rows()
	if err == nil {
		for rows.Next() {
			bug := model.BugPre{}
			class01 := model.Classifybug{}
			rows.Scan(&bug.BugSimple, &class01.BugReport, &class01.UserId, &class01.Id, &class01.Date, &class01.PredictBug)
			bug.Bug = class01
			bug.Img = user.Src
			bug.Username = user.Username
			bug.Id = user.Id
			bugPre = append(bugPre, bug)
		}
	}
	defer rows.Close()
	// for _, v := range classify {
	// 	bug := model.BugPre{
	// 		Bug:      v,
	// 		Img:      user.Src,
	// 		Username: user.Username,
	// 		Id:       user.Id,
	// 	}
	// 	bugPre = append(bugPre, bug)
	// }
	ctx.HTML(200, "bug_classify.html", gin.H{
		"bugPre": bugPre,
	})
}

func (con MoonshineCtroller) BugClassify(ctx *gin.Context) {

}
