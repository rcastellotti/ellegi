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
include abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/compiler_depend.make

# Include the progress variables for this target.
include abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/progress.make

# Include the compile flags for this target's objects.
include abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/flags.make

abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o: abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/flags.make
abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o: /workspaces/ellegi/oldissimo/abseil-cpp/absl/flags/internal/usage.cc
abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o: abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o"
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o -MF CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o.d -o CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o -c /workspaces/ellegi/oldissimo/abseil-cpp/absl/flags/internal/usage.cc

abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.i"
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspaces/ellegi/oldissimo/abseil-cpp/absl/flags/internal/usage.cc > CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.i

abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.s"
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspaces/ellegi/oldissimo/abseil-cpp/absl/flags/internal/usage.cc -o CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.s

# Object files for target absl_flags_usage_internal
absl_flags_usage_internal_OBJECTS = \
"CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o"

# External object files for target absl_flags_usage_internal
absl_flags_usage_internal_EXTERNAL_OBJECTS =

abseil-cpp/absl/flags/libabsl_flags_usage_internal.a: abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/internal/usage.cc.o
abseil-cpp/absl/flags/libabsl_flags_usage_internal.a: abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/build.make
abseil-cpp/absl/flags/libabsl_flags_usage_internal.a: abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/workspaces/ellegi/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libabsl_flags_usage_internal.a"
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && $(CMAKE_COMMAND) -P CMakeFiles/absl_flags_usage_internal.dir/cmake_clean_target.cmake
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/absl_flags_usage_internal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/build: abseil-cpp/absl/flags/libabsl_flags_usage_internal.a
.PHONY : abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/build

abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/clean:
	cd /workspaces/ellegi/build/abseil-cpp/absl/flags && $(CMAKE_COMMAND) -P CMakeFiles/absl_flags_usage_internal.dir/cmake_clean.cmake
.PHONY : abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/clean

abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/depend:
	cd /workspaces/ellegi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/ellegi/oldissimo /workspaces/ellegi/oldissimo/abseil-cpp/absl/flags /workspaces/ellegi/build /workspaces/ellegi/build/abseil-cpp/absl/flags /workspaces/ellegi/build/abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : abseil-cpp/absl/flags/CMakeFiles/absl_flags_usage_internal.dir/depend

