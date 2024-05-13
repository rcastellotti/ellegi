FROM mcr.microsoft.com/devcontainers/base:alpine-3.19
RUN apk add \
    clang cmake go nodejs gdb \
    fish tmux util-linux unzip protoc curl \
    abseil-cpp-dev boost-dev protobuf-dev gflags-dev gtest-dev benchmark-dev grpc-dev libgit2-dev 
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
# god I hate webdev
RUN curl -L -o /opt/pnpm https://github.com/pnpm/pnpm/releases/download/v9.1.0/pnpm-linuxstatic-arm64 && chmod +x /opt/pnpm
ENV PATH="${PATH}:/root/go/bin"


