package syzkaller

import "github.com/gin-gonic/gin"

type SyzkallerController struct {
}

func (con SyzkallerController) SyzkallerConfig(ctx *gin.Context) {
	ctx.HTML(200, "doctor-schedule.html", gin.H{})
}
