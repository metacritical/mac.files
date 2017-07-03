package main

import (
	"os"
	"fmt"
	"regexp"
	"os/exec"
)


func execCommand(command string) []byte{
	gitExec := exec.Command("git", command)
	outPut, _  := gitExec.Output()
	return outPut
}

func getSymbol(name string) string{
	return	map[string]string{
		"untracked":"\xe2\x9b\x94\xef\xb8\x8f\x0a" , "alliswell":"☯️ ", "recycle":"♻️ ", "hazard":"☢" , "deleted":"\xe2\x9d\x8c\x0a",
		"smiley":"🙂 ", "flag":"🚩 " , "repoahead":"\xe2\x8f\xab\x0a" , "prohibited":"\xf0\x9f\x9a\xab\x0a" , "changes":"\xE2\x9A\xA0\xEF\xB8\x8F",
	}[name]
}

func processStatus(status []byte) string{
	noVC, _ := regexp.Match("Not a git repository", status)
	unTracked, _ := regexp.Match("Untracked files", status)
	notStaged, _ := regexp.Match("Changes not staged for commit", status)

	switch {
		case noVC :
		return "NO-VC"
		case unTracked :
		return getSymbol("untracked")
		case notStaged :
		return getSymbol("changes")
		default:
		return "Fatal:"
	}

}

func gitBranch() []byte{
	return execCommand("branch")
}

func gitStatus() []byte{
	return execCommand("status")
}

func main(){
	var args []string = os.Args[0:]

	if len(args) > 1 {
		switch args[1]{
		case "b", "branch":
			fmt.Print(string(gitBranch()))
		case "s", "status":
			fmt.Print(processStatus(gitStatus()))
		default:
			fmt.Print(execCommand(args[1]))
		}
	}else{
		fmt.Println("Command Not found")
	}
}
