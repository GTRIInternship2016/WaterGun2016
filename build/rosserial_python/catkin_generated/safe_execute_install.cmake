execute_process(COMMAND "/home/student/watergun_2016/build/rosserial_python/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/student/watergun_2016/build/rosserial_python/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
