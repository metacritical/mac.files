package main

import (
	"os"
	"fmt"
	"regexp"
	"os/exec"
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
		"untracked":"\xe2\x9a\xa0\xef\xb8\x8f\x0a", "alliswell":"\xF0\x9F\x94\xAF",
		"hazard":"\xe2\x98\xa2\xef\xb8\x8f\x0a", "deleted":"\xE2\x9D\x8C", 
		"smiley":"\xf0\x9f\x99\x82\x0a", "flag":"\xf0\x9f\x9a\xa9\x0a", 
		"repoahead":"\xE2\x98\x9D", "prohibited":"\xf0\x9f\x9a\xab\x0a",
		"changes":"\xe2\x99\xbb\xef\xb8\x8f\x0a", "novc":"\xF0\x9F\x94\xAF",
	}[name]
}

func processStatus(status string) string{
	var noVC = regexp.MustCompile("Not a git repository")
	var unTracked = regexp.MustCompile("Untracked files")
	var notStaged = regexp.MustCompile("Changes not staged for commit")

	switch {
		case noVC.MatchString(status) :
		return getSymbol("novc")
		case unTracked.MatchString(status):
		return getSymbol("untracked")
		case notStaged.MatchString(status) :
		return getSymbol("changes")
		default:
		return getSymbol("alliswell")
	}
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
			fmt.Println(processStatus(gitStatus()), gitBranch())
		default:
			fmt.Print(execCommand(args[1]))
		}
	}else{
		fmt.Println("Command Not found")
	}
}
