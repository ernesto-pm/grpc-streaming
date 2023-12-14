package grpcclient

import (
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"server/pkg/protogen"
)

func ConnectRPC() (*grpc.ClientConn, protogen.RouteDefinitionClient, error) {
	var opts []grpc.DialOption
	opts = append(opts, grpc.WithTransportCredentials(insecure.NewCredentials()))

	conn, err := grpc.Dial("localhost:6000", opts...)
	if err != nil {
		return nil, nil, err
	}
	client := protogen.NewRouteDefinitionClient(conn)

	return conn, client, nil
}
