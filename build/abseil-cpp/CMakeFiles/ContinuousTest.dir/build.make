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

# Utility rule file for ContinuousTest.

# Include any custom commands dependencies for this target.
include abseil-cpp/CMakeFiles/ContinuousTest.dir/compiler_depend.make

# Include the progress variables for this target.
include abseil-cpp/CMakeFiles/ContinuousTest.dir/progress.make

abseil-cpp/CMakeFiles/ContinuousTest:
	cd /workspaces/ellegi/build/abseil-cpp && /usr/bin/ctest -D ContinuousTest

ContinuousTest: abseil-cpp/CMakeFiles/ContinuousTest
ContinuousTest: abseil-cpp/CMakeFiles/ContinuousTest.dir/build.make
.PHONY : ContinuousTest

# Rule to build all files generated by this target.
abseil-cpp/CMakeFiles/ContinuousTest.dir/build: ContinuousTest
.PHONY : abseil-cpp/CMakeFiles/ContinuousTest.dir/build

abseil-cpp/CMakeFiles/ContinuousTest.dir/clean:
	cd /workspaces/ellegi/build/abseil-cpp && $(CMAKE_COMMAND) -P CMakeFiles/ContinuousTest.dir/cmake_clean.cmake
.PHONY : abseil-cpp/CMakeFiles/ContinuousTest.dir/clean

abseil-cpp/CMakeFiles/ContinuousTest.dir/depend:
	cd /workspaces/ellegi/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspaces/ellegi/oldissimo /workspaces/ellegi/oldissimo/abseil-cpp /workspaces/ellegi/build /workspaces/ellegi/build/abseil-cpp /workspaces/ellegi/build/abseil-cpp/CMakeFiles/ContinuousTest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : abseil-cpp/CMakeFiles/ContinuousTest.dir/depend

