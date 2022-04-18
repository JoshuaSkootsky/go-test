# You can test a Makefile with the following command: cat -e -t -v makefile_name
# Source: https://stackoverflow.com/a/16945143/2562871
# Go Makefiles must have tabs

BINARY_NAME=hello-world
SUFFIX=.out
OS=linux

build:
	GOARCH=amd64 GOOS=linux go build -o ${BINARY_NAME}-${OS}${SUFFIX}  main.go

build_all: build
	GOARCH=amd64 GOOS=darwin go build -o bin/${BINARY_NAME}-darwin main.go
	GOARCH=amd64 GOOS=linux go build -o bin/${BINARY_NAME}-linux  main.go
	GOARCH=amd64 GOOS=windows go build -o bin/${BINARY_NAME}-windows  main.go

run:
	./${BINARY_NAME}

build_and_run: build run

clean:
	go clean
	rm ${BINARY_NAME}-darwin${SUFFIX} 
	rm ${BINARY_NAME}-linux${SUFFIX} 
	rm ${BINARY_NAME}-windows${SUFFIX} 