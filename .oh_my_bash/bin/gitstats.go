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
	outPut, err  := gitExec.Output()
	if err != nil {
		return err.Error()
	}
	return string(outPut)
}

func getSymbol(name string) string{
	return	map[string]string{
		"untracked":"\xE2\x80\xBC", "alliswell":"\xe2\x99\xbb\x0a",
		"hazard":"", "deleted":"\xE2\x9D\x8C", "smiley":"", "flag":"",
		"repoahead":"\xE2\x98\x9D", "prohibited":"",
		"changes":"\xE2\x9A\xA0", "novc":"\u26a0",
	}[name]
}

func processStatus(status string) string{
	prompt := make([]string, 5)
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
			fmt.Print(processStatus(gitStatus()) + gitBranch())
		default:
			fmt.Print(execCommand(args[1]))
		}
	}else{
		fmt.Println("Command Not found")
	}
}
