LDDFLAGS= -I $(CURDIR) \
          -I $(CURDIR)/src/re2 \
          -I $(CURDIR)/utfcpp-4.0.5/source/

CPPFLAGS= -g -Wno-everything -Wl,--copy-dt-needed-entries 

DEPENDS=$(wildcard src/re2/obj/re2/*.o)
DEPENDS2=$(wildcard src/re2/obj/util/*.o)

LDLIBS = -lprotobuf \
         -lstdc++ \
         -lboost_filesystem \
         -labsl_strings -labsl_hash -labsl_string_view -labsl_synchronization -labsl_raw_hash_set \
         -lgrpc++ \
         -lgflags \
         -lgit2 \
         -ldivsufsort \
         -lgtest

SRC = src/fs_indexer.cc src/dump_load.cc src/query_planner.cc src/content.cc src/codesearch.cc src/re_width.cc src/chunk.cc src/git_indexer.cc src/tagsearch.cc src/chunk_allocator.cc \
      src/lib/radix_sort.cc src/lib/metrics.cc src/lib/fs_linux.cc src/lib/debug.cc   \
      src/tools/grpc_server.cc src/tools/analyze-re.cc src/tools/inspect-index.cc src/tools/dump-file.cc \
      src/proto/config.pb.cc src/proto/livegrep.pb.cc src/proto/livegrep.grpc.pb.cc \
    
proto:
	mkdir -p $(CURDIR)/src/proto/
	protoc --cpp_out=$(CURDIR)/src/proto/ --proto_path $(CURDIR)/src/proto config.proto 
	protoc --cpp_out=$(CURDIR)/src/proto/ --proto_path $(CURDIR)/src/proto/ livegrep.proto
	protoc --grpc_out=$(CURDIR)/src/proto/ --proto_path $(CURDIR)/src/proto/ --plugin=protoc-gen-grpc=/usr/bin/grpc_cpp_plugin livegrep.proto 
	# protoc --go_out=$(CURDIR)/web/proto/ --proto_path $(CURDIR)/src/proto/ --go_opt=Mconfig.proto=/ --go_opt=Mlivegrep.proto=/ config.proto livegrep.proto
	# protoc --go_out=$(CURDIR)/src/proto/ --go-grpc_out=$(CURDIR)/web --proto_path $(CURDIR)/src/proto/  --plugin=protoc-gen-grpc=/root/go/bin/protoc-gen-go-grpc livegrep.proto 

codesearch: proto
	mkdir -p $(CURDIR)/bin
	clang $(LDDFLAGS) $(CPPFLAGS) $(DEPENDS) $(DEPENDS2) src/tools/codesearch.cc -o bin/codesearch $(SRC) $(LDLIBS) 

test: proto
	clang $(LDDFLAGS) $(CPPFLAGS) $(DEPENDS) $(DEPENDS2) test/planner_test.cc test/tagsearch_test.cc test/main.cc test/codesearch_test.cc -o bin/test $(SRC) $(LDLIBS) 
