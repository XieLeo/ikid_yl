# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/nvidia/ikid_ws2/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nvidia/ikid_ws2/build

# Include any dependencies generated for this target.
include ros_socket/CMakeFiles/server_special_gait.dir/depend.make

# Include the progress variables for this target.
include ros_socket/CMakeFiles/server_special_gait.dir/progress.make

# Include the compile flags for this target's objects.
include ros_socket/CMakeFiles/server_special_gait.dir/flags.make

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o: ros_socket/CMakeFiles/server_special_gait.dir/flags.make
ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o: /home/nvidia/ikid_ws2/src/ros_socket/src/server_special_gait.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nvidia/ikid_ws2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o"
	cd /home/nvidia/ikid_ws2/build/ros_socket && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o -c /home/nvidia/ikid_ws2/src/ros_socket/src/server_special_gait.cpp

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.i"
	cd /home/nvidia/ikid_ws2/build/ros_socket && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nvidia/ikid_ws2/src/ros_socket/src/server_special_gait.cpp > CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.i

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.s"
	cd /home/nvidia/ikid_ws2/build/ros_socket && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nvidia/ikid_ws2/src/ros_socket/src/server_special_gait.cpp -o CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.s

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.requires:

.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.requires

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.provides: ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.requires
	$(MAKE) -f ros_socket/CMakeFiles/server_special_gait.dir/build.make ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.provides.build
.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.provides

ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.provides.build: ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o


# Object files for target server_special_gait
server_special_gait_OBJECTS = \
"CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o"

# External object files for target server_special_gait
server_special_gait_EXTERNAL_OBJECTS =

/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: ros_socket/CMakeFiles/server_special_gait.dir/build.make
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /home/nvidia/ikid_ws2/devel/lib/librobotModel_ros_socket.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /home/nvidia/ikid_ws2/devel/lib/libmatlab_inv_ros_socket.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /home/nvidia/ikid_ws2/devel/lib/libmatlab_inv_data_ros_socket.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /home/nvidia/ikid_ws2/devel/lib/libmatlab_inv_terminate_ros_socket.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /home/nvidia/ikid_ws2/devel/lib/libmatlab_inv_initialize_ros_socket.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/libroscpp.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/librosconsole.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/librostime.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/libcpp_common.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: /opt/ros/melodic/lib/libserial.so
/home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait: ros_socket/CMakeFiles/server_special_gait.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nvidia/ikid_ws2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait"
	cd /home/nvidia/ikid_ws2/build/ros_socket && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server_special_gait.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
ros_socket/CMakeFiles/server_special_gait.dir/build: /home/nvidia/ikid_ws2/devel/lib/ros_socket/server_special_gait

.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/build

ros_socket/CMakeFiles/server_special_gait.dir/requires: ros_socket/CMakeFiles/server_special_gait.dir/src/server_special_gait.cpp.o.requires

.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/requires

ros_socket/CMakeFiles/server_special_gait.dir/clean:
	cd /home/nvidia/ikid_ws2/build/ros_socket && $(CMAKE_COMMAND) -P CMakeFiles/server_special_gait.dir/cmake_clean.cmake
.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/clean

ros_socket/CMakeFiles/server_special_gait.dir/depend:
	cd /home/nvidia/ikid_ws2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nvidia/ikid_ws2/src /home/nvidia/ikid_ws2/src/ros_socket /home/nvidia/ikid_ws2/build /home/nvidia/ikid_ws2/build/ros_socket /home/nvidia/ikid_ws2/build/ros_socket/CMakeFiles/server_special_gait.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : ros_socket/CMakeFiles/server_special_gait.dir/depend

