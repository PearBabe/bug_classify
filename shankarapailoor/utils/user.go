package utils

import (
	"fmt"
	_ "fmt"

	"github.com/gin-gonic/gin"
	"github.com/shankarapailoor/model"
)

func IsLogin(ctx *gin.Context) (bool, *model.User) {
	cookie, _ := ctx.Cookie("username")
	fmt.Println("cookie=", cookie)
	if cookie != "" {
		session, _ := GetSession(cookie)
		if session.UserId > 0 {
			user := &model.User{
				Id: session.UserId,
			}
			model.DB.Find(&user)
			return true, user
		}
	}
	return false, nil
}

func GetSession(cookie string) (*model.Session, error) {
	sess := &model.Session{
		SessionId: cookie,
	}
	model.DB.Find(&sess)
	//fmt.Println(sess)
	return sess, nil
}

func DeleteSession(cookie string) error {
	sess := model.Session{}
	model.DB.Where("session_id = ?", cookie).Delete(&sess)
	return nil
}
