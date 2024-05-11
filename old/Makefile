LDDFLAGS= -I /workspaces/ellegi/old \
          -I /workspaces/ellegi/old/src/re2 \
          -I /workspaces/ellegi/old/utfcpp-4.0.5/source/

CPPFLAGS= -g -Wno-everything -Wl,--copy-dt-needed-entries

LDLIBS = -lprotobuf \
         -lstdc++ \
         -lboost_filesystem \
         -labsl_strings -labsl_hash -labsl_string_view -labsl_synchronization -labsl_raw_hash_set \
         -lgrpc++ \
         -lgflags \
         -lre2 \
         -lgit2 \
         -ldivsufsort

SRC = src/fs_indexer.cc src/dump_load.cc src/query_planner.cc src/content.cc src/codesearch.cc src/re_width.cc src/chunk.cc src/git_indexer.cc src/tagsearch.cc src/chunk_allocator.cc \
      src/lib/radix_sort.cc src/lib/metrics.cc src/lib/fs_linux.cc src/lib/debug.cc   \
      src/tools/grpc_server.cc src/tools/analyze-re.cc src/tools/inspect-index.cc src/tools/dump-file.cc \
      src/proto/config.pb.cc src/proto/livegrep.pb.cc src/proto/livegrep.grpc.pb.cc \
	  src/re2/util/rune.cc src/re2/re2/simplify.cc src/re2/re2/regexp.cc src/re2/re2/parse.cc src/re2/re2/unicode_casefold.cc src/re2/re2/unicode_groups.cc src/re2/re2/perl_groups.cc src/re2/re2/tostring.cc \
    
proto:
	mkdir -p /workspaces/ellegi/old/src/proto/
	protoc --cpp_out=/workspaces/ellegi/old/src/proto/ --proto_path /workspaces/ellegi/old/src/proto config.proto 
	protoc --cpp_out=/workspaces/ellegi/old/src/proto/ --proto_path /workspaces/ellegi/old/src/proto/ livegrep.proto
	protoc --grpc_out=/workspaces/ellegi/old/src/proto/ --proto_path /workspaces/ellegi/old/src/proto/ --plugin=protoc-gen-grpc=/usr/bin/grpc_cpp_plugin livegrep.proto 
	protoc --go_out=/workspaces/ellegi/old/web/proto/ --proto_path /workspaces/ellegi/old/src/proto/ --go_opt=Mconfig.proto=/ --go_opt=Mlivegrep.proto=/ config.proto livegrep.proto
	protoc --go_out=/workspaces/ellegi/old/src/proto/ --go-grpc_out=/workspaces/ellegi/old/web --proto_path /workspaces/ellegi/old/src/proto/  --plugin=protoc-gen-grpc=/root/go/bin/protoc-gen-go-grpc livegrep.proto 

codesearch: proto
	mkdir -p /workspaces/ellegi/bin
	clang $(LDDFLAGS) $(CPPFLAGS) src/tools/codesearch.cc -o /workspaces/ellegi/bin/codesearch $(SRC) $(LDLIBS) 

test: proto
	mkdir -p /workspaces/ellegi/bin
	clang $(LDDFLAGS) $(CPPFLAGS) src/test.cc -o /workspaces/ellegi/bin/test $(SRC) $(LDLIBS) 