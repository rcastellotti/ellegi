FROM mcr.microsoft.com/devcontainers/base:alpine-3.19
RUN apk add clang \
    cmake \
    fish tmux util-linux \
    abseil-cpp-dev \
    boost-dev \
    unzip \ 
    protoc \
    curl \ 
    protobuf-dev \ 
    gflags-dev \
    gtest-dev \
    benchmark-dev \
    grpc-dev \
    libgit2-dev \
    go 

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
ENV PATH="${PATH}:/root/go/bin"