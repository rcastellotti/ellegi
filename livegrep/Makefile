CXX=clang
CXXFLAGS= -I $(CURDIR) \
		  -I $(CURDIR)/vendor/re2/ \
		  -I $(CURDIR)/vendor/utf8cpp/source/ \
		  -Wno-everything -Wl,--copy-dt-needed-entries 
		  
LDLIBS = -lprotobuf -lstdc++ -lboost_filesystem -labsl_strings -labsl_hash -labsl_string_view -labsl_synchronization -labsl_raw_hash_set -lgrpc++ -lgflags -lgit2  -ldivsufsort -lgtest

OBJ= src/fs_indexer.o src/dump_load.o src/query_planner.o src/content.o src/codesearch.o src/re_width.o src/chunk.o src/git_indexer.o src/tagsearch.o src/chunk_allocator.o \
      src/lib/radix_sort.o src/lib/metrics.o src/lib/fs_linux.o src/lib/debug.o   \
      src/tools/grpc_server.o src/tools/analyze-re.o src/tools/inspect-index.o src/tools/dump-file.o \
      src/proto/config.pb.o src/proto/livegrep.pb.o src/proto/livegrep.grpc.pb.o \

%.o: %.cc 
	$(CXX) $(CXXFLAGS) -c -o $@ $< $(LDDFLAGS) $(LDLIBS) 

codesearch: $(OBJ) vendor/re2/obj/libre2.a 	
	$(CXX) $(CXXFLAGS) src/tools/codesearch.cc -o bin/$@ $^  $(LDLIBS) 

vendor/re2/obj/libre2.a:
	make -C vendor/re2

dependencies: utf8cpp libdivsufsort

utf8ccp:
	curl -L -o /opt/utf8cpp.tar.gz https://github.com/nemtrif/utfcpp/archive/refs/tags/v4.0.5.tar.gz
	tar -xf /opt/utf8cpp.tar.gz -C $(CURDIR)/vendor/utf8cpp --strip-components 1

libdivsufsort:
	curl -L -o /opt/libdivsufsort.tar.gz https://github.com/y-256/libdivsufsort/archive/refs/tags/2.0.1.tar.gz
	mkdir -p $(CURDIR)/vendor/libdivsufsort
	tar -xf /opt/libdivsufsort.tar.gz -C $(CURDIR)/vendor/libdivsufsort --strip-components 1
	mkdir -p $(CURDIR)/vendor/libdivsufsort/build && cd $(CURDIR)/vendor/libdivsufsort/build && cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr/local" .. && make && make install

clean:
	rm -rf src/*.o src/lib/*.o src/tools/*.o src/proto/*.o
	make clean -C vendor/re2