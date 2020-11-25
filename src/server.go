package main

import (
	"fmt"
	"log"
	"net/http"
	"os/exec"
)

func enableCors(w *http.ResponseWriter) {
	(*w).Header().Set("Access-Control-Allow-Origin", "*")
}

func handler(w http.ResponseWriter, r *http.Request) {
	// Enable CORS Policy
	enableCors(&w)

	if r.Method == "POST" {
		r.ParseForm()
		if r.FormValue("start") == "true" {
			// Execute commands
			cmd := exec.Command("/bin/bash", "./sh/bandwidth.sh", r.FormValue("trace"))
			if err := cmd.Run(); err != nil {
				fmt.Printf("error %s", err)
			}
		} else {
			fmt.Println("[LOG-1] Not start")
		}
	} else {
		fmt.Println("[LOG-2] Not POST")
	}
}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
