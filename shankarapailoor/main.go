package main

import (
	"fmt"
	"net/http"
	"os"
	"os/exec"
	"path"
	"strconv"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-contrib/sessions"
	"github.com/gin-contrib/sessions/cookie"
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/model"
	"github.com/shankarapailoor/routers"
	"github.com/shankarapailoor/utils"
)

// func CrosHandler() gin.HandlerFunc {
// 	return func(context *gin.Context) {
// 		method := context.Request.Method
// 		context.Writer.Header().Set("Access-Control-Allow-Origin", "*")
// 		context.Header("Access-Control-Allow-Origin", "*") // 设置允许访问所有域
// 		context.Header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE,UPDATE")
// 		context.Header("Access-Control-Allow-Headers", "Authorization, Content-Length, X-CSRF-Token, Token,session,X_Requested_With,Accept, Origin, Host, Connection, Accept-Encoding, Accept-Language,DNT, X-CustomHeader, Keep-Alive, User-Agent, X-Requested-With, If-Modified-Since, Cache-Control, Content-Type, Pragma,token,openid,opentoken")
// 		context.Header("Access-Control-Expose-Headers", "Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers,Cache-Control,Content-Language,Content-Type,Expires,Last-Modified,Pragma,FooBar")
// 		context.Header("Access-Control-Max-Age", "172800")
// 		context.Header("Access-Control-Allow-Credentials", "false")
// 		context.Set("content-type", "application/json")

// 		if method == "OPTIONS" {
// 			context.JSON(http.StatusOK, result.Result{Code: result.OK, Data: "Options Request!"})
// 		}

//			//处理请求
//			context.Next()
//		}
//	}
func main() {
	r := gin.Default()
	// r.Use(CrosHandler())

	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"https://foo.com"},
		AllowMethods:     []string{"PUT", "PATCH"},
		AllowHeaders:     []string{"Origin"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		AllowOriginFunc: func(origin string) bool {
			return origin == "https://github.com"
		},
		MaxAge: 12 * time.Hour,
	}))

	r.Static("/static", "./static")
	r.Static("/layui", "./layui")
	r.LoadHTMLGlob("templates/**/*")

	store := cookie.NewStore([]byte("secret"))
	r.Use(sessions.Sessions("mysession", store))

	routers.AdminRoutersInit(r)
	routers.MoonshineRoutersInit(r)
	routers.DefaultRoutersInit(r)

	r.POST("/bugPrediction", func(ctx *gin.Context) {
		bugReport := ctx.PostForm("bugReport")
		cookie, _ := ctx.Cookie("username")
		sess := model.Session{
			SessionId: cookie,
		}
		model.DB.Find(&sess)
		user := model.User{}
		model.DB.Where("id=?", sess.UserId).Find(&user)
		cmd := exec.Command("python", "main.py", bugReport)
		data, _ := cmd.Output()
		// fmt.Println(string(data))
		data02 := string(data)
		fmt.Println(data02)
		date := utils.GetDate()
		classify := model.Classifybug{
			BugReport:  bugReport,
			PredictBug: data02,
			Date:       date,
			UserId:     user.Id,
		}
		model.DB.Create(&classify)
		ctx.JSON(200, gin.H{
			"predict": data02,
		})

	})

	r.POST("/uploadArg", func(ctx *gin.Context) {
		id1 := ctx.Query("id")
		//fmt.Println(id1)
		id, _ := strconv.ParseInt(id1, 10, 64)
		distill := ctx.PostForm("distill")
		//fmt.Println(distill)
		file, err := ctx.FormFile("file")
		if err == nil {
			extName := path.Ext(file.Filename)
			day := utils.GetDay()
			dir := "./static/upload/" + day
			err := os.MkdirAll(dir, 0666)
			if err != nil {
				ctx.String(200, "MKdirll失败")
				return
			}
			unix := utils.GetUnix()
			fileName := strconv.FormatInt(unix, 10) + extName
			dst := path.Join(dir, fileName)
			err1 := ctx.SaveUploadedFile(file, dst)
			if err1 != nil {
				fmt.Println("错误", err1)
			}
		}
		var cmd *exec.Cmd
		if distill == "rows" {
			cmd = exec.Command("./moonshine/bin/moonshine",
				"-dir", "./moonshine/getting-started/sampletraces/")
		} else {
			cmd = exec.Command("./moonshine/bin/moonshine",
				"-dir", "./moonshine/getting-started/sampletraces/",
				"-distill", "./moonshine/getting-started/distill.json")
		}

		//fmt.Println(cmd.Args)

		res, err := cmd.CombinedOutput()
		if err != nil {
			fmt.Println(err)
		}
		disresult := fmt.Sprintf(string(res))
		date := utils.GetDate()
		disres := model.Disres{
			DisResult: disresult,
			UserId:    id,
			Distill:   distill,
			Date:      date,
		}
		model.DB.Create(&disres)
		model.DB.Where("user_id=? AND date=?", id, disres.Date).Find(&disres)
		//fmt.Println("disId=", disres.DisId)
		disresrec := model.Disresrec{}
		model.DB.Where("dis_id=?", disres.DisId).Find(&disresrec)
		fileTotal := disresrec.FileTotal
		seedsTotal := disresrec.SeedsTotal
		proTotal := disresrec.ProTotal
		distillPro := disresrec.DistiiledProgram
		validCalls := disresrec.ValidCalls
		deserPro := disresrec.DeserializedProgram
		avgPro := disresrec.AvgPro
		ctx.JSON(http.StatusOK, gin.H{
			"distill":    distill,
			"fileTotal":  fileTotal,
			"seedsTotal": seedsTotal,
			"proTotal":   proTotal,
			"avgPro":     avgPro,
			"distillPro": distillPro,
			"validCalls": validCalls,
			"deserPro":   deserPro,
			"date":       date,
			"disId":      disres.DisId,
			// "dst":     dst,
		})
	})

	r.Run(":8088")
}
