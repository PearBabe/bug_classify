package model

type User struct {
	Id       int64  `json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`
	Email    string `json:"email"`
	Src      string `json:"src"`
}

func (user User) TableName() string {
	return "user"
}
