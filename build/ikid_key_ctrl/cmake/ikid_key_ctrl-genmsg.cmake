# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ikid_key_ctrl: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iikid_key_ctrl:/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ikid_key_ctrl_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_custom_target(_ikid_key_ctrl_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ikid_key_ctrl" "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ikid_key_ctrl
  "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ikid_key_ctrl
)

### Generating Services

### Generating Module File
_generate_module_cpp(ikid_key_ctrl
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ikid_key_ctrl
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ikid_key_ctrl_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ikid_key_ctrl_generate_messages ikid_key_ctrl_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_dependencies(ikid_key_ctrl_generate_messages_cpp _ikid_key_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ikid_key_ctrl_gencpp)
add_dependencies(ikid_key_ctrl_gencpp ikid_key_ctrl_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ikid_key_ctrl_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ikid_key_ctrl
  "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ikid_key_ctrl
)

### Generating Services

### Generating Module File
_generate_module_eus(ikid_key_ctrl
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ikid_key_ctrl
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ikid_key_ctrl_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ikid_key_ctrl_generate_messages ikid_key_ctrl_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_dependencies(ikid_key_ctrl_generate_messages_eus _ikid_key_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ikid_key_ctrl_geneus)
add_dependencies(ikid_key_ctrl_geneus ikid_key_ctrl_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ikid_key_ctrl_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ikid_key_ctrl
  "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ikid_key_ctrl
)

### Generating Services

### Generating Module File
_generate_module_lisp(ikid_key_ctrl
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ikid_key_ctrl
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ikid_key_ctrl_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ikid_key_ctrl_generate_messages ikid_key_ctrl_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_dependencies(ikid_key_ctrl_generate_messages_lisp _ikid_key_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ikid_key_ctrl_genlisp)
add_dependencies(ikid_key_ctrl_genlisp ikid_key_ctrl_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ikid_key_ctrl_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ikid_key_ctrl
  "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ikid_key_ctrl
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ikid_key_ctrl
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ikid_key_ctrl
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ikid_key_ctrl_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ikid_key_ctrl_generate_messages ikid_key_ctrl_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_dependencies(ikid_key_ctrl_generate_messages_nodejs _ikid_key_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ikid_key_ctrl_gennodejs)
add_dependencies(ikid_key_ctrl_gennodejs ikid_key_ctrl_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ikid_key_ctrl_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ikid_key_ctrl
  "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ikid_key_ctrl
)

### Generating Services

### Generating Module File
_generate_module_py(ikid_key_ctrl
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ikid_key_ctrl
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ikid_key_ctrl_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ikid_key_ctrl_generate_messages ikid_key_ctrl_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/ikid_key_ctrl/msg/cmd_walk.msg" NAME_WE)
add_dependencies(ikid_key_ctrl_generate_messages_py _ikid_key_ctrl_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ikid_key_ctrl_genpy)
add_dependencies(ikid_key_ctrl_genpy ikid_key_ctrl_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ikid_key_ctrl_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ikid_key_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ikid_key_ctrl
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ikid_key_ctrl_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ikid_key_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ikid_key_ctrl
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ikid_key_ctrl_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ikid_key_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ikid_key_ctrl
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ikid_key_ctrl_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ikid_key_ctrl)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ikid_key_ctrl
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ikid_key_ctrl_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ikid_key_ctrl)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ikid_key_ctrl\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ikid_key_ctrl
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ikid_key_ctrl_generate_messages_py std_msgs_generate_messages_py)
endif()
