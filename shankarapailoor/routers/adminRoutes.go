package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/controllers/admin"
	"github.com/shankarapailoor/middlewares"
)

func AdminRoutersInit(r *gin.Engine) {
	adminRouter := r.Group("/admin", middlewares.InitMiddleWares)
	{
		adminRouter.GET("/", admin.UserController{}.Admin)
		adminRouter.GET("/about", admin.UserController{}.About)
		adminRouter.POST("/login", admin.UserController{}.Login)
		adminRouter.POST("/regist", admin.UserController{}.Regist)
		adminRouter.GET("/logout", admin.UserController{}.Logout)
		adminRouter.POST("/checkUserName", admin.UserController{}.CheckUserName)
		adminRouter.GET("/editUser", admin.UserController{}.EditUser)
		adminRouter.POST("/uploadSrc", admin.UserController{}.UploadSrc)
		adminRouter.POST("/editUsername", admin.UserController{}.EditUsername)
		adminRouter.POST("/editEmail", admin.UserController{}.EditEmail)
		adminRouter.POST("/editPassword", admin.UserController{}.EditPassword)
		adminRouter.POST("/editSrc", admin.UserController{}.EditSrc)
	}
}
