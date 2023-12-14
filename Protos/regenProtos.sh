# Regenerate the go implementation
protoc --go_out=../Server/pkg/protogen --go_opt=paths=source_relative \
  --go-grpc_out=../Server/pkg/protogen --go-grpc_opt=paths=source_relative \
  ./PluginService.proto

protoc ./PluginService.proto \
  --proto_path=./ \
  --swift_opt=Visibility=Public \
  --grpc-swift_opt=Visibility=Public \
  --swift_out=../SwiftPlugin/Sources/protogen \
  --grpc-swift_out=../SwiftPlugin/Sources/protogen