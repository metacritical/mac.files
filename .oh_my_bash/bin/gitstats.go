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
		"untracked":"❓", "alliswell":"🙂 ☯️", "recycle":"♻️ ",
		"hazard":"☢", "deleted":"❌", "smiley":"🙂 ", "flag":"🚩 " ,
		"repoahead":"⏫", "prohibited":"🚫",
		"changes":"♻️", "novc":"⚠️",
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
		prompt = append(prompt, getSymbol("alliswell"))
	}

	return strings.Join(prompt, "")
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
			fmt.Print(processStatus(gitStatus()) , gitBranch())
		default:
			fmt.Print(execCommand(args[1]))
		}
	}else{
		fmt.Println("Command Not found")
	}
}
