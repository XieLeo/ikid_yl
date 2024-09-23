# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "localization_pkg: 7 messages, 0 services")

set(MSG_I_FLAGS "-Ilocalization_pkg:/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(localization_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" "geometry_msgs/Pose2D"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" "geometry_msgs/Pose2D:localization_pkg/Particle:std_msgs/Header"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_custom_target(_localization_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "localization_pkg" "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" "localization_pkg/ObjectDetection:geometry_msgs/Pose2D:localization_pkg/LineDetection:localization_pkg/ObstacleDetection:std_msgs/Header:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)
_generate_msg_cpp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(localization_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(localization_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(localization_pkg_generate_messages localization_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_cpp _localization_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_pkg_gencpp)
add_dependencies(localization_pkg_gencpp localization_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)
_generate_msg_eus(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
)

### Generating Services

### Generating Module File
_generate_module_eus(localization_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(localization_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(localization_pkg_generate_messages localization_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_eus _localization_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_pkg_geneus)
add_dependencies(localization_pkg_geneus localization_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)
_generate_msg_lisp(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(localization_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(localization_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(localization_pkg_generate_messages localization_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_lisp _localization_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_pkg_genlisp)
add_dependencies(localization_pkg_genlisp localization_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)
_generate_msg_nodejs(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(localization_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(localization_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(localization_pkg_generate_messages localization_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_nodejs _localization_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_pkg_gennodejs)
add_dependencies(localization_pkg_gennodejs localization_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)
_generate_msg_py(localization_pkg
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg;/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(localization_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(localization_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(localization_pkg_generate_messages localization_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Particle.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObjectDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/CompassHeading.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ObstacleDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/ParticleSet.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/LineDetection.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/localization_pkg/msg/Detections.msg" NAME_WE)
add_dependencies(localization_pkg_generate_messages_py _localization_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(localization_pkg_genpy)
add_dependencies(localization_pkg_genpy localization_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS localization_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/localization_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(localization_pkg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(localization_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/localization_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(localization_pkg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(localization_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/localization_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(localization_pkg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(localization_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/localization_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(localization_pkg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(localization_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/localization_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(localization_pkg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(localization_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
