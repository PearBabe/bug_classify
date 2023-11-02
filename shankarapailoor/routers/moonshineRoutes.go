package routers

import (
	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/controllers/moonshine"
)

func MoonshineRoutersInit(r *gin.Engine) {
	moonRouters := r.Group("/moonshine")
	{
		moonRouters.GET("/", moonshine.MoonshineCtroller{}.BackstPre)
		moonRouters.GET("/ifameSelect", moonshine.MoonshineCtroller{}.IframeSelect)
		moonRouters.POST("/addMark", moonshine.MoonshineCtroller{}.AddMark)
		moonRouters.GET("/fuzzList", moonshine.MoonshineCtroller{}.FuzzList)
		moonRouters.GET("/PerFuzzList", moonshine.MoonshineCtroller{}.PerFuzzList)
		moonRouters.POST("/editRemark", moonshine.MoonshineCtroller{}.EditRemark)
		moonRouters.GET("/getRemarkByDisId", moonshine.MoonshineCtroller{}.GetRemarkByDisId)
		moonRouters.GET("/deleteDisres", moonshine.MoonshineCtroller{}.DeleteDisres)
		moonRouters.GET("/resultSta", moonshine.MoonshineCtroller{}.ResultSta)
		moonRouters.GET("/syzkallerConfig", moonshine.MoonshineCtroller{}.SyzkallerConfig)
		moonRouters.POST("/bugClassify", moonshine.MoonshineCtroller{}.BugClassify)
	}
}
