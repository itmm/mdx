# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_SOURCE_DIR = /home/timm/prj/mdx

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/timm/prj/mdx/build

# Include any dependencies generated for this target.
include CMakeFiles/mdx.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/mdx.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mdx.dir/flags.make

../mdx.cpp: ../mdx.md
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/timm/prj/mdx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating ../mdx.cpp"
	cd /home/timm/prj/mdx && /home/timm/bin/mdp mdx.md && touch mdx.cpp

CMakeFiles/mdx.dir/mdx.cpp.o: CMakeFiles/mdx.dir/flags.make
CMakeFiles/mdx.dir/mdx.cpp.o: ../mdx.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/timm/prj/mdx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mdx.dir/mdx.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mdx.dir/mdx.cpp.o -c /home/timm/prj/mdx/mdx.cpp

CMakeFiles/mdx.dir/mdx.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mdx.dir/mdx.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/timm/prj/mdx/mdx.cpp > CMakeFiles/mdx.dir/mdx.cpp.i

CMakeFiles/mdx.dir/mdx.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mdx.dir/mdx.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/timm/prj/mdx/mdx.cpp -o CMakeFiles/mdx.dir/mdx.cpp.s

# Object files for target mdx
mdx_OBJECTS = \
"CMakeFiles/mdx.dir/mdx.cpp.o"

# External object files for target mdx
mdx_EXTERNAL_OBJECTS =

mdx: CMakeFiles/mdx.dir/mdx.cpp.o
mdx: CMakeFiles/mdx.dir/build.make
mdx: lazy-write/liblazy-write.a
mdx: CMakeFiles/mdx.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/timm/prj/mdx/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable mdx"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mdx.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mdx.dir/build: mdx

.PHONY : CMakeFiles/mdx.dir/build

CMakeFiles/mdx.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mdx.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mdx.dir/clean

CMakeFiles/mdx.dir/depend: ../mdx.cpp
	cd /home/timm/prj/mdx/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/timm/prj/mdx /home/timm/prj/mdx /home/timm/prj/mdx/build /home/timm/prj/mdx/build /home/timm/prj/mdx/build/CMakeFiles/mdx.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mdx.dir/depend

