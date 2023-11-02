package model

import (
	"fmt"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB
var err error

func init() {
	dsn := "root:277348@tcp(192.168.192.1:3306)/fuzz?charset=utf8mb4&parseTime=True&loc=Local"
	DB, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	// DB.SingularTable(true)
	if err != nil {
		fmt.Println(err)
	}
}
