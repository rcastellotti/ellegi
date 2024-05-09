CPPFLAGS= -I /workspaces/ellegi/old \
          -I /workspaces/ellegi/old/re2 \
		  -I /workspaces/ellegi/old/third_party/divsufsort \
		  -I /workspaces/ellegi/old/third_party/utf8cpp/source

LDLIBS = -lprotobuf \
         -libstdc++ \
		 -lboost_filesystem \
		 -labsl_strings -labsl_hash  -labsl_synchronization -labsl_raw_hash_set \
		 -lgrpc++ \
		 -lre2 \
		 -lgflags \
		 -lgit2

SRC = src/fs_indexer.cc \
      src/git_indexer.cc \
	  src/chunk_allocator.cc \
	  src/codesearch.cc \
	  src/dump_load.cc  \
	  src/tools/grpc_server.cc \
	  src/query_planner.cc \
	  src/content.cc \
	  src/lib/metrics.cc \
	  src/tools/analyze-re.cc \
	  src/proto/gen/config.pb.cc \
	  src/proto/gen/livegrep.grpc.pb.cc \
	  src/proto/gen/livegrep.pb.cc \
	  src/lib/fs_linux.cc \
	  src/lib/debug.cc \
	  src/dump_load.cc

all:
	clang $(CPPFLAGS)  --std=c++14 -D src/tools/codesearch.cc $(SRC) $(LDLIBS)  > report 2>&1