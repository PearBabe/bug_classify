package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/controllers/defaultPre"
)

func DefaultRoutersInit(r *gin.Engine) {
	defaultRouter := r.Group("/")
	{
		defaultRouter.GET("/", defaultPre.DefaultController{}.DefaultPre)
	}
}
