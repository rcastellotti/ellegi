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
include abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/compiler_depend.make

# Include the progress variables for this target.
include abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/progress.make

# Include the compile flags for this target's objects.
include abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/flags.make

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/flags.make
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o: /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/crc32c.cc
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o -MF CMakeFiles/absl_crc32c.dir/crc32c.cc.o.d -o CMakeFiles/absl_crc32c.dir/crc32c.cc.o -c /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/crc32c.cc

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/absl_crc32c.dir/crc32c.cc.i"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/crc32c.cc > CMakeFiles/absl_crc32c.dir/crc32c.cc.i

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/absl_crc32c.dir/crc32c.cc.s"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/crc32c.cc -o CMakeFiles/absl_crc32c.dir/crc32c.cc.s

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/flags.make
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o: /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_fallback.cc
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o -MF CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o.d -o CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o -c /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_fallback.cc

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.i"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_fallback.cc > CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.i

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.s"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_fallback.cc -o CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.s

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/flags.make
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o: /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_x86_64.cc
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o -MF CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o.d -o CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o -c /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_x86_64.cc

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.i"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_x86_64.cc > CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.i

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.s"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_memcpy_x86_64.cc -o CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.s

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/flags.make
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_non_temporal_memcpy.cc
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o -MF CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o.d -o CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o -c /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_non_temporal_memcpy.cc

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.i"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_non_temporal_memcpy.cc > CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.i

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.s"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc/internal/crc_non_temporal_memcpy.cc -o CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.s

# Object files for target absl_crc32c
absl_crc32c_OBJECTS = \
"CMakeFiles/absl_crc32c.dir/crc32c.cc.o" \
"CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o" \
"CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o" \
"CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o"

# External object files for target absl_crc32c
absl_crc32c_EXTERNAL_OBJECTS =

abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/crc32c.cc.o
abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_fallback.cc.o
abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_memcpy_x86_64.cc.o
abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/internal/crc_non_temporal_memcpy.cc.o
abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/build.make
abseil-cpp/absl/crc/libabsl_crc32c.a: abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libabsl_crc32c.a"
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && $(CMAKE_COMMAND) -P CMakeFiles/absl_crc32c.dir/cmake_clean_target.cmake
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/absl_crc32c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/build: abseil-cpp/absl/crc/libabsl_crc32c.a
.PHONY : abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/build

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/clean:
	cd /workspaces/ellegi/build/abseil-cpp/absl/crc && $(CMAKE_COMMAND) -P CMakeFiles/absl_crc32c.dir/cmake_clean.cmake
.PHONY : abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/clean

abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/depend:
	cd /workspaces/ellegi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/ellegi/oldissimo /workspaces/ellegi/oldissimo/abseil-cpp/absl/crc /workspaces/ellegi/build /workspaces/ellegi/build/abseil-cpp/absl/crc /workspaces/ellegi/build/abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : abseil-cpp/absl/crc/CMakeFiles/absl_crc32c.dir/depend

