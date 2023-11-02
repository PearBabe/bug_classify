package model

type Classifybug struct {
	Id         int64
	BugReport  string
	PredictBug string
	Date       string
	UserId     int64
}

func (Classifybug) TableName() string {
	return "classifybug"
}
