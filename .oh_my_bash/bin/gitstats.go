package main

import (
	"os"
	"fmt"
	"regexp"
	"os/exec"
	"strings"
)


func execCommand(command string) string{
	gitExec := exec.Command("git", command)
	outPut, _  := gitExec.Output()
	return string(outPut)
}

func getSymbol(name string) string{
	return	map[string]string{
		"untracked":"\xe2\x9b\x94\xef\xb8\x8f\x0a", "alliswell":"☯️ ", "recycle":"♻️ ",
		"hazard":"☢", "deleted":"\xe2\x9d\x8c\x0a", "smiley":"🙂 ", "flag":"🚩 " ,
		"repoahead":"\xe2\x8f\xab\x0a", "prohibited":"\xf0\x9f\x9a\xab\x0a",
		"changes":"\xE2\x9A\xA0\xEF\xB8\x8F", "novc":"\xe2\x9d\x97\xef\xb8\x8f\x0a",
	}[name]
}

func processStatus(status string) string{
	prompt := make([]string, 1)
	var noVC = regexp.MustCompile("Not a git repository")
	var unTracked = regexp.MustCompile("Untracked files")
	var notStaged = regexp.MustCompile("Changes not staged for commit")

	switch {
		case noVC.MatchString(status) :
		prompt = append(prompt, getSymbol("novc"))
		case unTracked.MatchString(status):
		prompt = append(prompt, getSymbol("untracked"))
		case notStaged.MatchString(status) :
		prompt = append(prompt, getSymbol("changes"))
		default:
		prompt = append(prompt, getSymbol("flag"))
	}

	return strings.Join(prompt, " ")
}

func gitBranch() string{
	return execCommand("branch")
}

func gitStatus() string{
	return execCommand("status")
}

func main(){
	var args []string = os.Args[0:]

	if len(args) > 1 {
		switch args[1]{
		case "b", "branch":
			fmt.Print(gitBranch())
		case "s", "status":
			fmt.Print(processStatus(gitStatus()))
		case "p", "prompt":
			fmt.Print(gitBranch(), processStatus(gitStatus()))
		default:
			fmt.Print(execCommand(args[1]))
		}
	}else{
		fmt.Println("Command Not found")
	}
}
