package model

type Disresrec struct {
	DisId               int
	FileTotal           string
	SeedsTotal          string
	ProTotal            string
	DistiiledProgram    string
	ValidCalls          string
	DeserializedProgram string
	CreateTime          string
	AvgPro              string
}

func (Disresrec) TableName() string {
	return "disresrec"
}
