package model

type Session struct {
	SessionId string
	Username  string
	UserId    int64
}

func (Session) TableName() string {
	return "session"
}
