.PHONY: clean
clean:
	rm -rf proto/helloworld/*.go

.PHONY: protoc
protoc:
	protoc -I . \
	  -I $(GOPATH)/src/github.com/googleapis/googleapis \
	  --go_out . \
	  --go_opt paths=source_relative \
	  --go-grpc_out . \
	  --go-grpc_opt paths=source_relative \
	  --grpc-gateway_out . \
	  --grpc-gateway_opt logtostderr=true \
	  --grpc-gateway_opt paths=source_relative \
	  --grpc-gateway_opt generate_unbound_methods=true \
	  proto/helloworld/helloworld.proto
