CCDIR= $(CURDIR)/src
CXX=clang
CXXFLAGS= -Wl,--copy-dt-needed-entries
LDDFLAGS = -I$(CURDIR) \
		  -I$(CCDIR)/vendor/re2/ \
		  -I$(CCDIR)/vendor/libdivsufsort/build/include \
		  -I$(CCDIR)/vendor/utf8cpp/source/\
		  -lprotobuf -lgrpc++ \
		  -lstdc++ -lboost_filesystem -labsl_strings  -labsl_string_view -labsl_synchronization -labsl_raw_hash_set  -lgflags -lgit2  -lgtest

OBJ= src/fs_indexer.o src/dump_load.o src/query_planner.o src/content.o src/codesearch.o src/re_width.o src/chunk.o src/git_indexer.o src/tagsearch.o src/chunk_allocator.o \
      src/lib/radix_sort.o src/lib/metrics.o src/lib/fs_linux.o src/lib/debug.o   \
      src/tools/grpc_server.o src/proto/config.pb.o src/proto/livegrep.pb.o src/proto/livegrep.grpc.pb.o \

PROTODIR= $(CURDIR)/src/proto

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

setup:
	mkdir -p bin
	mkdir -p bin/tools

%.o: %.cc 
	$(CXX) $(CXXFLAGS) -c -o $@ $< $(LDDFLAGS) $(LDLIBS) 

codesearch: $(OBJ)  src/vendor/re2/obj/libre2.a src/vendor/libdivsufsort/build/lib/libdivsufsort.a
	$(CXX) $(CXXFLAGS) src/tools/codesearch.cc -o bin/$@ $^  $(LDDFLAGS) 

tools/inspect-index, tools/analyze-re, tools/dump-file:  $(OBJ) src/vendor/re2/obj/libre2.a src/vendor/libdivsufsort/build/lib/libdivsufsort.a
	$(CXX) $(CXXFLAGS) src/$@.cc -o bin/$@ $^  $(LDDFLAGS) 


codesearchtool: $(OBJ) src/vendor/re2/obj/libre2.a
	$(CXX) $(CXXFLAGS) src/tools/codesearchtool.cc -o bin/$@ $^  $(LDLIBS) 

## test: build and run tests for codesearch
test: $(OBJ) src/vendor/re2/obj/libre2.a src/vendor/libdivsufsort/build/lib/libdivsufsort.a 
	$(CXX) $(CXXFLAGS) test/codesearch_test.cc test/planner_test.cc test/tagsearch_test.cc test/main.cc -o bin/$@ $^  $(LDDFLAGS) 
	$(CURDIR)/bin/test

web-stuff:
	cd web/frontend && /opt/pnpm install && ./node_modules/webpack/bin/webpack.js


src/vendor/re2/obj/libre2.a:
	make -C src/vendor/re2

src/vendor/libdivsufsort/build/lib/libdivsufsort.a:
	mkdir -p $(CCDIR)/vendor/libdivsufsort/build \
	cd $(CCDIR)/vendor/libdivsufsort/build \
	cmake -DCMAKE_BUILD_TYPE="Release" -DBUILD_SHARED_LIBS="off" .. \
	make

dependencies: utf8cpp libdivsufsort

utf8ccp:
	curl -L -o /opt/utf8cpp.tar.gz https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.5.tar.gz
	tar -xf /opt/utf8cpp.tar.gz -C $(CCDIR)/vendor/utf8cpp --strip-components 1

download-libdivsufsort:
	curl -L -o /opt/libdivsufsort.tar.gz https://github.com/y-256/libdivsufsort/archive/refs/tags/2.0.1.tar.gz
	mkdir -p $(CCDIR)/vendor/libdivsufsort
	tar -xf /opt/libdivsufsort.tar.gz -C $(CCDIR)/vendor/libdivsufsort --strip-components 1

install-libdivsufsort:
	

## proto: generate go and cpp files in `web/proto` and `src/proto`
proto:
	mkdir -p $(CURDIR)/src/proto
	mkdir -p $(CURDIR)/web/proto
	protoc --cpp_out=$(CURDIR)/src/proto/  --proto_path=$(PROTODIR)/ config.proto livegrep.proto 
	protoc --grpc_out=$(CURDIR)/src/proto/  --proto_path=$(PROTODIR)/ --plugin=protoc-gen-grpc=/usr/bin/grpc_cpp_plugin livegrep.proto  
	protoc --go_out=$(CURDIR)/web/proto/   --proto_path=$(PROTODIR)/ --go_opt=Mconfig.proto=/ --go_opt=Mlivegrep.proto=/ config.proto livegrep.proto
	protoc --go_out=$(PROTODIR) --go-grpc_out=$(CURDIR)/web --proto_path=$(PROTODIR)/ --plugin=protoc-gen-grpc=/root/go/bin/protoc-gen-go-grpc livegrep.proto 



clean:
	rm -rf src/*.o src/lib/*.o src/tools/*.o src/proto/*.o
	make clean -C vendor/re2
	rm -rf src/vendor/build/
