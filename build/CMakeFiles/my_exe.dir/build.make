# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspaces/ellegi/oldissimo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspaces/ellegi/build

# Include any dependencies generated for this target.
include CMakeFiles/my_exe.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/my_exe.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/my_exe.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_exe.dir/flags.make

CMakeFiles/my_exe.dir/src/chunk.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/chunk.cc.o: /workspaces/ellegi/oldissimo/src/chunk.cc
CMakeFiles/my_exe.dir/src/chunk.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/my_exe.dir/src/chunk.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/chunk.cc.o -MF CMakeFiles/my_exe.dir/src/chunk.cc.o.d -o CMakeFiles/my_exe.dir/src/chunk.cc.o -c /workspaces/ellegi/oldissimo/src/chunk.cc

CMakeFiles/my_exe.dir/src/chunk.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/chunk.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/chunk.cc > CMakeFiles/my_exe.dir/src/chunk.cc.i

CMakeFiles/my_exe.dir/src/chunk.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/chunk.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/chunk.cc -o CMakeFiles/my_exe.dir/src/chunk.cc.s

CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o: /workspaces/ellegi/oldissimo/src/tools/codesearch.cc
CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o -MF CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o.d -o CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o -c /workspaces/ellegi/oldissimo/src/tools/codesearch.cc

CMakeFiles/my_exe.dir/src/tools/codesearch.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/tools/codesearch.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/tools/codesearch.cc > CMakeFiles/my_exe.dir/src/tools/codesearch.cc.i

CMakeFiles/my_exe.dir/src/tools/codesearch.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/tools/codesearch.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/tools/codesearch.cc -o CMakeFiles/my_exe.dir/src/tools/codesearch.cc.s

CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o: /workspaces/ellegi/oldissimo/src/lib/radix_sort.cc
CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o -MF CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o.d -o CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o -c /workspaces/ellegi/oldissimo/src/lib/radix_sort.cc

CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/lib/radix_sort.cc > CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.i

CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/lib/radix_sort.cc -o CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.s

CMakeFiles/my_exe.dir/src/dump_load.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/dump_load.cc.o: /workspaces/ellegi/oldissimo/src/dump_load.cc
CMakeFiles/my_exe.dir/src/dump_load.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/my_exe.dir/src/dump_load.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/dump_load.cc.o -MF CMakeFiles/my_exe.dir/src/dump_load.cc.o.d -o CMakeFiles/my_exe.dir/src/dump_load.cc.o -c /workspaces/ellegi/oldissimo/src/dump_load.cc

CMakeFiles/my_exe.dir/src/dump_load.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/dump_load.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/dump_load.cc > CMakeFiles/my_exe.dir/src/dump_load.cc.i

CMakeFiles/my_exe.dir/src/dump_load.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/dump_load.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/dump_load.cc -o CMakeFiles/my_exe.dir/src/dump_load.cc.s

CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o: /workspaces/ellegi/oldissimo/src/lib/fs_linux.cc
CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o -MF CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o.d -o CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o -c /workspaces/ellegi/oldissimo/src/lib/fs_linux.cc

CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/lib/fs_linux.cc > CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.i

CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/lib/fs_linux.cc -o CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.s

CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o: /workspaces/ellegi/oldissimo/src/tools/dump-file.cc
CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o -MF CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o.d -o CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o -c /workspaces/ellegi/oldissimo/src/tools/dump-file.cc

CMakeFiles/my_exe.dir/src/tools/dump-file.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/tools/dump-file.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/tools/dump-file.cc > CMakeFiles/my_exe.dir/src/tools/dump-file.cc.i

CMakeFiles/my_exe.dir/src/tools/dump-file.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/tools/dump-file.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/tools/dump-file.cc -o CMakeFiles/my_exe.dir/src/tools/dump-file.cc.s

CMakeFiles/my_exe.dir/src/lib/debug.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/lib/debug.cc.o: /workspaces/ellegi/oldissimo/src/lib/debug.cc
CMakeFiles/my_exe.dir/src/lib/debug.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/my_exe.dir/src/lib/debug.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/lib/debug.cc.o -MF CMakeFiles/my_exe.dir/src/lib/debug.cc.o.d -o CMakeFiles/my_exe.dir/src/lib/debug.cc.o -c /workspaces/ellegi/oldissimo/src/lib/debug.cc

CMakeFiles/my_exe.dir/src/lib/debug.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/lib/debug.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/lib/debug.cc > CMakeFiles/my_exe.dir/src/lib/debug.cc.i

CMakeFiles/my_exe.dir/src/lib/debug.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/lib/debug.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/lib/debug.cc -o CMakeFiles/my_exe.dir/src/lib/debug.cc.s

CMakeFiles/my_exe.dir/src/content.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/content.cc.o: /workspaces/ellegi/oldissimo/src/content.cc
CMakeFiles/my_exe.dir/src/content.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/my_exe.dir/src/content.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/content.cc.o -MF CMakeFiles/my_exe.dir/src/content.cc.o.d -o CMakeFiles/my_exe.dir/src/content.cc.o -c /workspaces/ellegi/oldissimo/src/content.cc

CMakeFiles/my_exe.dir/src/content.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/content.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/content.cc > CMakeFiles/my_exe.dir/src/content.cc.i

CMakeFiles/my_exe.dir/src/content.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/content.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/content.cc -o CMakeFiles/my_exe.dir/src/content.cc.s

CMakeFiles/my_exe.dir/src/fs_indexer.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/fs_indexer.cc.o: /workspaces/ellegi/oldissimo/src/fs_indexer.cc
CMakeFiles/my_exe.dir/src/fs_indexer.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/my_exe.dir/src/fs_indexer.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/fs_indexer.cc.o -MF CMakeFiles/my_exe.dir/src/fs_indexer.cc.o.d -o CMakeFiles/my_exe.dir/src/fs_indexer.cc.o -c /workspaces/ellegi/oldissimo/src/fs_indexer.cc

CMakeFiles/my_exe.dir/src/fs_indexer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/fs_indexer.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/fs_indexer.cc > CMakeFiles/my_exe.dir/src/fs_indexer.cc.i

CMakeFiles/my_exe.dir/src/fs_indexer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/fs_indexer.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/fs_indexer.cc -o CMakeFiles/my_exe.dir/src/fs_indexer.cc.s

CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o: /workspaces/ellegi/oldissimo/src/chunk_allocator.cc
CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o -MF CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o.d -o CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o -c /workspaces/ellegi/oldissimo/src/chunk_allocator.cc

CMakeFiles/my_exe.dir/src/chunk_allocator.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/chunk_allocator.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/chunk_allocator.cc > CMakeFiles/my_exe.dir/src/chunk_allocator.cc.i

CMakeFiles/my_exe.dir/src/chunk_allocator.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/chunk_allocator.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/chunk_allocator.cc -o CMakeFiles/my_exe.dir/src/chunk_allocator.cc.s

CMakeFiles/my_exe.dir/src/git_indexer.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/git_indexer.cc.o: /workspaces/ellegi/oldissimo/src/git_indexer.cc
CMakeFiles/my_exe.dir/src/git_indexer.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/my_exe.dir/src/git_indexer.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/git_indexer.cc.o -MF CMakeFiles/my_exe.dir/src/git_indexer.cc.o.d -o CMakeFiles/my_exe.dir/src/git_indexer.cc.o -c /workspaces/ellegi/oldissimo/src/git_indexer.cc

CMakeFiles/my_exe.dir/src/git_indexer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/git_indexer.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/git_indexer.cc > CMakeFiles/my_exe.dir/src/git_indexer.cc.i

CMakeFiles/my_exe.dir/src/git_indexer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/git_indexer.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/git_indexer.cc -o CMakeFiles/my_exe.dir/src/git_indexer.cc.s

CMakeFiles/my_exe.dir/src/codesearch.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/codesearch.cc.o: /workspaces/ellegi/oldissimo/src/codesearch.cc
CMakeFiles/my_exe.dir/src/codesearch.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/my_exe.dir/src/codesearch.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/codesearch.cc.o -MF CMakeFiles/my_exe.dir/src/codesearch.cc.o.d -o CMakeFiles/my_exe.dir/src/codesearch.cc.o -c /workspaces/ellegi/oldissimo/src/codesearch.cc

CMakeFiles/my_exe.dir/src/codesearch.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/codesearch.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/codesearch.cc > CMakeFiles/my_exe.dir/src/codesearch.cc.i

CMakeFiles/my_exe.dir/src/codesearch.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/codesearch.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/codesearch.cc -o CMakeFiles/my_exe.dir/src/codesearch.cc.s

CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o: /workspaces/ellegi/oldissimo/src/proto/config.pb.cc
CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o -MF CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o.d -o CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o -c /workspaces/ellegi/oldissimo/src/proto/config.pb.cc

CMakeFiles/my_exe.dir/src/proto/config.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/proto/config.pb.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/proto/config.pb.cc > CMakeFiles/my_exe.dir/src/proto/config.pb.cc.i

CMakeFiles/my_exe.dir/src/proto/config.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/proto/config.pb.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/proto/config.pb.cc -o CMakeFiles/my_exe.dir/src/proto/config.pb.cc.s

CMakeFiles/my_exe.dir/src/lib/metrics.cc.o: CMakeFiles/my_exe.dir/flags.make
CMakeFiles/my_exe.dir/src/lib/metrics.cc.o: /workspaces/ellegi/oldissimo/src/lib/metrics.cc
CMakeFiles/my_exe.dir/src/lib/metrics.cc.o: CMakeFiles/my_exe.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/my_exe.dir/src/lib/metrics.cc.o"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/my_exe.dir/src/lib/metrics.cc.o -MF CMakeFiles/my_exe.dir/src/lib/metrics.cc.o.d -o CMakeFiles/my_exe.dir/src/lib/metrics.cc.o -c /workspaces/ellegi/oldissimo/src/lib/metrics.cc

CMakeFiles/my_exe.dir/src/lib/metrics.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/my_exe.dir/src/lib/metrics.cc.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/src/lib/metrics.cc > CMakeFiles/my_exe.dir/src/lib/metrics.cc.i

CMakeFiles/my_exe.dir/src/lib/metrics.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/my_exe.dir/src/lib/metrics.cc.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/src/lib/metrics.cc -o CMakeFiles/my_exe.dir/src/lib/metrics.cc.s

# Object files for target my_exe
my_exe_OBJECTS = \
"CMakeFiles/my_exe.dir/src/chunk.cc.o" \
"CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o" \
"CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o" \
"CMakeFiles/my_exe.dir/src/dump_load.cc.o" \
"CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o" \
"CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o" \
"CMakeFiles/my_exe.dir/src/lib/debug.cc.o" \
"CMakeFiles/my_exe.dir/src/content.cc.o" \
"CMakeFiles/my_exe.dir/src/fs_indexer.cc.o" \
"CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o" \
"CMakeFiles/my_exe.dir/src/git_indexer.cc.o" \
"CMakeFiles/my_exe.dir/src/codesearch.cc.o" \
"CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o" \
"CMakeFiles/my_exe.dir/src/lib/metrics.cc.o"

# External object files for target my_exe
my_exe_EXTERNAL_OBJECTS =

my_exe: CMakeFiles/my_exe.dir/src/chunk.cc.o
my_exe: CMakeFiles/my_exe.dir/src/tools/codesearch.cc.o
my_exe: CMakeFiles/my_exe.dir/src/lib/radix_sort.cc.o
my_exe: CMakeFiles/my_exe.dir/src/dump_load.cc.o
my_exe: CMakeFiles/my_exe.dir/src/lib/fs_linux.cc.o
my_exe: CMakeFiles/my_exe.dir/src/tools/dump-file.cc.o
my_exe: CMakeFiles/my_exe.dir/src/lib/debug.cc.o
my_exe: CMakeFiles/my_exe.dir/src/content.cc.o
my_exe: CMakeFiles/my_exe.dir/src/fs_indexer.cc.o
my_exe: CMakeFiles/my_exe.dir/src/chunk_allocator.cc.o
my_exe: CMakeFiles/my_exe.dir/src/git_indexer.cc.o
my_exe: CMakeFiles/my_exe.dir/src/codesearch.cc.o
my_exe: CMakeFiles/my_exe.dir/src/proto/config.pb.cc.o
my_exe: CMakeFiles/my_exe.dir/src/lib/metrics.cc.o
my_exe: CMakeFiles/my_exe.dir/build.make
my_exe: /usr/lib/libre2.so.11.0.0
my_exe: /usr/lib/libabsl_flags.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_marshalling.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_reflection.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_config.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_program_name.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_private_handle_accessor.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_commandlineflag.so.2308.0.0
my_exe: /usr/lib/libabsl_flags_commandlineflag_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_cord.so.2308.0.0
my_exe: /usr/lib/libabsl_cordz_info.so.2308.0.0
my_exe: /usr/lib/libabsl_cord_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_cordz_functions.so.2308.0.0
my_exe: /usr/lib/libabsl_cordz_handle.so.2308.0.0
my_exe: /usr/lib/libabsl_crc_cord_state.so.2308.0.0
my_exe: /usr/lib/libabsl_crc32c.so.2308.0.0
my_exe: /usr/lib/libabsl_crc_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_crc_cpu_detect.so.2308.0.0
my_exe: /usr/lib/libabsl_raw_hash_set.so.2308.0.0
my_exe: /usr/lib/libabsl_hash.so.2308.0.0
my_exe: /usr/lib/libabsl_city.so.2308.0.0
my_exe: /usr/lib/libabsl_bad_variant_access.so.2308.0.0
my_exe: /usr/lib/libabsl_low_level_hash.so.2308.0.0
my_exe: /usr/lib/libabsl_hashtablez_sampler.so.2308.0.0
my_exe: /usr/lib/libabsl_exponential_biased.so.2308.0.0
my_exe: /usr/lib/libabsl_bad_optional_access.so.2308.0.0
my_exe: /usr/lib/libabsl_str_format_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_synchronization.so.2308.0.0
my_exe: /usr/lib/libabsl_graphcycles_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_kernel_timeout_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_stacktrace.so.2308.0.0
my_exe: /usr/lib/libabsl_symbolize.so.2308.0.0
my_exe: /usr/lib/libabsl_malloc_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_debugging_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_demangle_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_time.so.2308.0.0
my_exe: /usr/lib/libabsl_strings.so.2308.0.0
my_exe: /usr/lib/libabsl_string_view.so.2308.0.0
my_exe: /usr/lib/libabsl_throw_delegate.so.2308.0.0
my_exe: /usr/lib/libabsl_strings_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_base.so.2308.0.0
my_exe: /usr/lib/libabsl_spinlock_wait.so.2308.0.0
my_exe: /usr/lib/libabsl_raw_logging_internal.so.2308.0.0
my_exe: /usr/lib/libabsl_log_severity.so.2308.0.0
my_exe: /usr/lib/libabsl_int128.so.2308.0.0
my_exe: /usr/lib/libabsl_civil_time.so.2308.0.0
my_exe: /usr/lib/libabsl_time_zone.so.2308.0.0
my_exe: /usr/lib/libicuuc.so
my_exe: CMakeFiles/my_exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking CXX executable my_exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_exe.dir/build: my_exe
.PHONY : CMakeFiles/my_exe.dir/build

CMakeFiles/my_exe.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_exe.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_exe.dir/clean

CMakeFiles/my_exe.dir/depend:
	cd /workspaces/ellegi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/ellegi/oldissimo /workspaces/ellegi/oldissimo /workspaces/ellegi/build /workspaces/ellegi/build /workspaces/ellegi/build/CMakeFiles/my_exe.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/my_exe.dir/depend

