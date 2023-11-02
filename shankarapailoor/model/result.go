package model

type Result struct {
	Id           int64
	FilesTotal   string
	SeedsTotal   string
	ProTotal     string
	DistilledPro string
	ValidCalls   string
	File         string
	DeserFile    string
	AvgPro       string
	Distill      string
}

func (Result) TableName() string {
	return "result"
}
