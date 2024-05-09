FROM mcr.microsoft.com/devcontainers/base:alpine-3.19
RUN apk add clang \
    cmake \
    fish \
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
WORKDIR "/workspaces/ellegi/old/"
RUN <<EOF 
    curl -L -o /opt/libdivsufsort.tar.gz https://github.com/y-256/libdivsufsort/archive/refs/tags/2.0.1.tar.gz
    tar -xf /opt/libdivsufsort.tar.gz -C /opt
    mkdir -p /opt/libdivsufsort-2.0.1/build && cd /opt/libdivsufsort-2.0.1/build && cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr/local" .. && make && make install
EOF
RUN <<EOF 
    curl -L -o /opt/utf8cpp.tar.gz https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.5.tar.gz
    tar -xf /opt/utf8cpp.tar.gz -C /workspaces/ellegi/old
EOF
RUN <<EOF 
    curl -L -o /opt/re2-2024-05-01.tar.gz https://github.com/google/re2/releases/download/2024-05-01/re2-2024-05-01.tar.gz
    tar -xf /opt/re2-2024-05-01.tar.gz -C /opt
    cd /opt/re2-2024-05-01 && make && make install
EOF