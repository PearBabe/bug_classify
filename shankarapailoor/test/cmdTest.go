package main

import (
	"fmt"
	"os/exec"
	"testing"

	_ "github.com/google/syzkaller/pkg/log"
	_ "github.com/google/syzkaller/prog"
)

func TestCommand(t *testing.T) {
	cmd := exec.Command("../moonshine/bin/moonshine",
		"-dir", "../moonshine/getting-started/sampletraces/",
		"-distill", "../moonshine/getting-started/distill.json")
	fmt.Println(cmd.Args)

	res, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(string(res))

}
