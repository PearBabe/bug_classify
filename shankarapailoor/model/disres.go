package model

type Disres struct {
	DisId     int64
	DisResult string
	UserId    int64
	Distill   string
	Date      string
	Remark    string
}

func (Disres) TableName() string {
	return "disres"
}
