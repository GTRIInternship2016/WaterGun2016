# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/student/watergun_2016/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/student/watergun_2016/build

# Include any dependencies generated for this target.
include pedtracker/src/CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include pedtracker/src/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include pedtracker/src/CMakeFiles/main.dir/flags.make

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o: /home/student/watergun_2016/src/pedtracker/src/pedDetTracker_ROS.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/pedDetTracker_ROS.cpp

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/pedDetTracker_ROS.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/pedDetTracker_ROS.cpp > CMakeFiles/main.dir/pedDetTracker_ROS.cpp.i

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/pedDetTracker_ROS.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/pedDetTracker_ROS.cpp -o CMakeFiles/main.dir/pedDetTracker_ROS.cpp.s

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o: /home/student/watergun_2016/src/pedtracker/src/rgbConvert.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/rgbConvert.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/rgbConvert.cpp

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/rgbConvert.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/rgbConvert.cpp > CMakeFiles/main.dir/rgbConvert.cpp.i

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/rgbConvert.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/rgbConvert.cpp -o CMakeFiles/main.dir/rgbConvert.cpp.s

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o: /home/student/watergun_2016/src/pedtracker/src/chnsCompute.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/chnsCompute.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/chnsCompute.cpp

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/chnsCompute.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/chnsCompute.cpp > CMakeFiles/main.dir/chnsCompute.cpp.i

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/chnsCompute.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/chnsCompute.cpp -o CMakeFiles/main.dir/chnsCompute.cpp.s

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o: /home/student/watergun_2016/src/pedtracker/src/getScales.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/getScales.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/getScales.cpp

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/getScales.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/getScales.cpp > CMakeFiles/main.dir/getScales.cpp.i

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/getScales.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/getScales.cpp -o CMakeFiles/main.dir/getScales.cpp.s

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o: /home/student/watergun_2016/src/pedtracker/src/opencvInterface.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/opencvInterface.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/opencvInterface.cpp

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/opencvInterface.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/opencvInterface.cpp > CMakeFiles/main.dir/opencvInterface.cpp.i

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/opencvInterface.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/opencvInterface.cpp -o CMakeFiles/main.dir/opencvInterface.cpp.s

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o: /home/student/watergun_2016/src/pedtracker/src/strongClassifierTree.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/strongClassifierTree.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/strongClassifierTree.cpp

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/strongClassifierTree.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/strongClassifierTree.cpp > CMakeFiles/main.dir/strongClassifierTree.cpp.i

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/strongClassifierTree.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/strongClassifierTree.cpp -o CMakeFiles/main.dir/strongClassifierTree.cpp.s

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o: /home/student/watergun_2016/src/pedtracker/src/convConst.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/convConst.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/convConst.cpp

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/convConst.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/convConst.cpp > CMakeFiles/main.dir/convConst.cpp.i

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/convConst.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/convConst.cpp -o CMakeFiles/main.dir/convConst.cpp.s

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o: /home/student/watergun_2016/src/pedtracker/src/wrappers.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/wrappers.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/wrappers.cpp

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/wrappers.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/wrappers.cpp > CMakeFiles/main.dir/wrappers.cpp.i

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/wrappers.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/wrappers.cpp -o CMakeFiles/main.dir/wrappers.cpp.s

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o: /home/student/watergun_2016/src/pedtracker/src/readFiles.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/readFiles.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/readFiles.cpp

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/readFiles.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/readFiles.cpp > CMakeFiles/main.dir/readFiles.cpp.i

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/readFiles.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/readFiles.cpp -o CMakeFiles/main.dir/readFiles.cpp.s

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o: /home/student/watergun_2016/src/pedtracker/src/chnsPyramid.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/chnsPyramid.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/chnsPyramid.cpp

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/chnsPyramid.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/chnsPyramid.cpp > CMakeFiles/main.dir/chnsPyramid.cpp.i

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/chnsPyramid.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/chnsPyramid.cpp -o CMakeFiles/main.dir/chnsPyramid.cpp.s

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o: /home/student/watergun_2016/src/pedtracker/src/pedDetector.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/pedDetector.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/pedDetector.cpp

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/pedDetector.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/pedDetector.cpp > CMakeFiles/main.dir/pedDetector.cpp.i

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/pedDetector.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/pedDetector.cpp -o CMakeFiles/main.dir/pedDetector.cpp.s

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o: /home/student/watergun_2016/src/pedtracker/src/pedDetTrackerMain_ROS.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/pedDetTrackerMain_ROS.cpp

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/pedDetTrackerMain_ROS.cpp > CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.i

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/pedDetTrackerMain_ROS.cpp -o CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.s

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o: pedtracker/src/CMakeFiles/main.dir/flags.make
pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o: /home/student/watergun_2016/src/pedtracker/src/gradientMex.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/student/watergun_2016/build/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/gradientMex.cpp.o -c /home/student/watergun_2016/src/pedtracker/src/gradientMex.cpp

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/gradientMex.cpp.i"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/student/watergun_2016/src/pedtracker/src/gradientMex.cpp > CMakeFiles/main.dir/gradientMex.cpp.i

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/gradientMex.cpp.s"
	cd /home/student/watergun_2016/build/pedtracker/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/student/watergun_2016/src/pedtracker/src/gradientMex.cpp -o CMakeFiles/main.dir/gradientMex.cpp.s

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.requires:
.PHONY : pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.requires

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.provides: pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.requires
	$(MAKE) -f pedtracker/src/CMakeFiles/main.dir/build.make pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.provides.build
.PHONY : pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.provides

pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.provides.build: pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o" \
"CMakeFiles/main.dir/rgbConvert.cpp.o" \
"CMakeFiles/main.dir/chnsCompute.cpp.o" \
"CMakeFiles/main.dir/getScales.cpp.o" \
"CMakeFiles/main.dir/opencvInterface.cpp.o" \
"CMakeFiles/main.dir/strongClassifierTree.cpp.o" \
"CMakeFiles/main.dir/convConst.cpp.o" \
"CMakeFiles/main.dir/wrappers.cpp.o" \
"CMakeFiles/main.dir/readFiles.cpp.o" \
"CMakeFiles/main.dir/chnsPyramid.cpp.o" \
"CMakeFiles/main.dir/pedDetector.cpp.o" \
"CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o" \
"CMakeFiles/main.dir/gradientMex.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/build.make
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libcv_bridge.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libimage_transport.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libmessage_filters.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libclass_loader.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/libPocoFoundation.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libdl.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libroslib.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libroscpp.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/librosconsole.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/liblog4cxx.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/librostime.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/student/watergun_2016/devel/lib/peddetector/main: /opt/ros/indigo/lib/libcpp_common.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/student/watergun_2016/devel/lib/peddetector/main: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/student/watergun_2016/devel/lib/peddetector/main: pedtracker/src/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/student/watergun_2016/devel/lib/peddetector/main"
	cd /home/student/watergun_2016/build/pedtracker/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pedtracker/src/CMakeFiles/main.dir/build: /home/student/watergun_2016/devel/lib/peddetector/main
.PHONY : pedtracker/src/CMakeFiles/main.dir/build

pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/pedDetTracker_ROS.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/rgbConvert.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/chnsCompute.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/getScales.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/opencvInterface.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/strongClassifierTree.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/convConst.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/wrappers.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/readFiles.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/chnsPyramid.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/pedDetector.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/pedDetTrackerMain_ROS.cpp.o.requires
pedtracker/src/CMakeFiles/main.dir/requires: pedtracker/src/CMakeFiles/main.dir/gradientMex.cpp.o.requires
.PHONY : pedtracker/src/CMakeFiles/main.dir/requires

pedtracker/src/CMakeFiles/main.dir/clean:
	cd /home/student/watergun_2016/build/pedtracker/src && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : pedtracker/src/CMakeFiles/main.dir/clean

pedtracker/src/CMakeFiles/main.dir/depend:
	cd /home/student/watergun_2016/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/student/watergun_2016/src /home/student/watergun_2016/src/pedtracker/src /home/student/watergun_2016/build /home/student/watergun_2016/build/pedtracker/src /home/student/watergun_2016/build/pedtracker/src/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pedtracker/src/CMakeFiles/main.dir/depend

