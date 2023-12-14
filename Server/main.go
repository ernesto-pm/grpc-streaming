package main

import (
	"fmt"
	"server/pkg/grpcclient"
)

func main() {
	conn, _, err := grpcclient.ConnectRPC()
	if err != nil {
		fmt.Println(err)
	}
	defer conn.Close()
}
