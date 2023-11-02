package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/controllers/syzkaller"
)

func SyzkallerRoutersInit(r *gin.Engine) {
	syzRouters := r.Group("/syzkaller")
	{
		syzRouters.GET("/config", syzkaller.SyzkallerController{}.SyzkallerConfig)
	}
}
