
This allows you to remove `/home/adam/go/blah` from stacktraces

https://github.com/golang/go/issues/13809#issuecomment-168874760
go build -gcflags=-trimpath=$GOPATH -asmflags=-trimpath=$GOPATH

https://itnext.io/trim-gopath-from-stack-trace-88b7402c8b47
