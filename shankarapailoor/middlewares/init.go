package middlewares

import (
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
)

func InitMiddleWares(ctx *gin.Context) {
	fmt.Println(time.Now())
	fmt.Println(ctx.Request.URL)
}
