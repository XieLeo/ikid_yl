# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "site_inspection: 2 messages, 0 services")

set(MSG_I_FLAGS "-Isite_inspection:/home/nvidia/ikid_ws2/src/site_inspection/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(site_inspection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_custom_target(_site_inspection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "site_inspection" "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_custom_target(_site_inspection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "site_inspection" "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/site_inspection
)
_generate_msg_cpp(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/site_inspection
)

### Generating Services

### Generating Module File
_generate_module_cpp(site_inspection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/site_inspection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(site_inspection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(site_inspection_generate_messages site_inspection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_cpp _site_inspection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_cpp _site_inspection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(site_inspection_gencpp)
add_dependencies(site_inspection_gencpp site_inspection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS site_inspection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/site_inspection
)
_generate_msg_eus(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/site_inspection
)

### Generating Services

### Generating Module File
_generate_module_eus(site_inspection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/site_inspection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(site_inspection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(site_inspection_generate_messages site_inspection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_eus _site_inspection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_eus _site_inspection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(site_inspection_geneus)
add_dependencies(site_inspection_geneus site_inspection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS site_inspection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/site_inspection
)
_generate_msg_lisp(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/site_inspection
)

### Generating Services

### Generating Module File
_generate_module_lisp(site_inspection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/site_inspection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(site_inspection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(site_inspection_generate_messages site_inspection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_lisp _site_inspection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_lisp _site_inspection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(site_inspection_genlisp)
add_dependencies(site_inspection_genlisp site_inspection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS site_inspection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/site_inspection
)
_generate_msg_nodejs(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/site_inspection
)

### Generating Services

### Generating Module File
_generate_module_nodejs(site_inspection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/site_inspection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(site_inspection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(site_inspection_generate_messages site_inspection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_nodejs _site_inspection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_nodejs _site_inspection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(site_inspection_gennodejs)
add_dependencies(site_inspection_gennodejs site_inspection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS site_inspection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection
)
_generate_msg_py(site_inspection
  "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection
)

### Generating Services

### Generating Module File
_generate_module_py(site_inspection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(site_inspection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(site_inspection_generate_messages site_inspection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/cmd_walk.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_py _site_inspection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/site_inspection/msg/robot_head_pos.msg" NAME_WE)
add_dependencies(site_inspection_generate_messages_py _site_inspection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(site_inspection_genpy)
add_dependencies(site_inspection_genpy site_inspection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS site_inspection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/site_inspection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/site_inspection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(site_inspection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/site_inspection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/site_inspection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(site_inspection_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/site_inspection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/site_inspection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(site_inspection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/site_inspection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/site_inspection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(site_inspection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/site_inspection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(site_inspection_generate_messages_py std_msgs_generate_messages_py)
endif()
