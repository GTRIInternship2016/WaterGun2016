# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "camera: 2 messages, 0 services")

set(MSG_I_FLAGS "-Icamera:/home/student/watergun_2016/src/camera/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(camera_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/BoundBox.msg" NAME_WE)
add_custom_target(_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera" "/home/student/watergun_2016/src/camera/msg/BoundBox.msg" ""
)

get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/Target.msg" NAME_WE)
add_custom_target(_camera_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "camera" "/home/student/watergun_2016/src/camera/msg/Target.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(camera
  "/home/student/watergun_2016/src/camera/msg/BoundBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera
)
_generate_msg_cpp(camera
  "/home/student/watergun_2016/src/camera/msg/Target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera
)

### Generating Services

### Generating Module File
_generate_module_cpp(camera
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(camera_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(camera_generate_messages camera_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/BoundBox.msg" NAME_WE)
add_dependencies(camera_generate_messages_cpp _camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/Target.msg" NAME_WE)
add_dependencies(camera_generate_messages_cpp _camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_gencpp)
add_dependencies(camera_gencpp camera_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(camera
  "/home/student/watergun_2016/src/camera/msg/BoundBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera
)
_generate_msg_lisp(camera
  "/home/student/watergun_2016/src/camera/msg/Target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera
)

### Generating Services

### Generating Module File
_generate_module_lisp(camera
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(camera_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(camera_generate_messages camera_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/BoundBox.msg" NAME_WE)
add_dependencies(camera_generate_messages_lisp _camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/Target.msg" NAME_WE)
add_dependencies(camera_generate_messages_lisp _camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_genlisp)
add_dependencies(camera_genlisp camera_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(camera
  "/home/student/watergun_2016/src/camera/msg/BoundBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera
)
_generate_msg_py(camera
  "/home/student/watergun_2016/src/camera/msg/Target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera
)

### Generating Services

### Generating Module File
_generate_module_py(camera
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(camera_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(camera_generate_messages camera_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/BoundBox.msg" NAME_WE)
add_dependencies(camera_generate_messages_py _camera_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/watergun_2016/src/camera/msg/Target.msg" NAME_WE)
add_dependencies(camera_generate_messages_py _camera_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(camera_genpy)
add_dependencies(camera_genpy camera_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS camera_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/camera
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(camera_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(camera_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/camera
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(camera_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(camera_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/camera
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(camera_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(camera_generate_messages_py sensor_msgs_generate_messages_py)
