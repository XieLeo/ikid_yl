# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "config_server: 2 messages, 6 services")

set(MSG_I_FLAGS "-Iconfig_server:/home/nvidia/ikid_ws2/src/localization/config_server/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(config_server_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" "config_server/ParameterDescription"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" "config_server/ParameterDescription"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" ""
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" "config_server/ParameterDescription"
)

get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_custom_target(_config_server_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "config_server" "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_msg_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)

### Generating Services
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)
_generate_srv_cpp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
)

### Generating Module File
_generate_module_cpp(config_server
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(config_server_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(config_server_generate_messages config_server_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_cpp _config_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(config_server_gencpp)
add_dependencies(config_server_gencpp config_server_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS config_server_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_msg_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)

### Generating Services
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)
_generate_srv_eus(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
)

### Generating Module File
_generate_module_eus(config_server
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(config_server_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(config_server_generate_messages config_server_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_eus _config_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(config_server_geneus)
add_dependencies(config_server_geneus config_server_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS config_server_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_msg_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)

### Generating Services
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)
_generate_srv_lisp(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
)

### Generating Module File
_generate_module_lisp(config_server
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(config_server_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(config_server_generate_messages config_server_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_lisp _config_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(config_server_genlisp)
add_dependencies(config_server_genlisp config_server_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS config_server_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_msg_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)

### Generating Services
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)
_generate_srv_nodejs(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
)

### Generating Module File
_generate_module_nodejs(config_server
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(config_server_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(config_server_generate_messages config_server_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_nodejs _config_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(config_server_gennodejs)
add_dependencies(config_server_gennodejs config_server_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS config_server_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_msg_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)

### Generating Services
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv"
  "${MSG_I_FLAGS}"
  "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)
_generate_srv_py(config_server
  "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
)

### Generating Module File
_generate_module_py(config_server
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(config_server_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(config_server_generate_messages config_server_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterList.msg" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/msg/ParameterDescription.msg" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Subscribe.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Save.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/Load.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/GetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SubscribeList.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nvidia/ikid_ws2/src/localization/config_server/srv/SetParameter.srv" NAME_WE)
add_dependencies(config_server_generate_messages_py _config_server_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(config_server_genpy)
add_dependencies(config_server_genpy config_server_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS config_server_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/config_server
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(config_server_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/config_server
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(config_server_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/config_server
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(config_server_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/config_server
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(config_server_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/config_server
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(config_server_generate_messages_py std_msgs_generate_messages_py)
endif()
