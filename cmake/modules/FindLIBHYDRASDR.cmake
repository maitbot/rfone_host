# - Try to find the libhydrasdr library
# Once done this defines
#
#  LIBHYDRASDR_FOUND - system has libhydrasdr
#  LIBHYDRASDR_INCLUDE_DIR - the libhydrasdr include directory
#  LIBHYDRASDR_LIBRARIES - Link these to use libhydrasdr

# Copyright (c) 2013-2025  Benjamin Vernoux
#

if (LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)

  # in cache already
  set(LIBHYDRASDR_FOUND TRUE)

else (LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)
  IF (NOT WIN32)
    # use pkg-config to get the directories and then use these values
    # in the FIND_PATH() and FIND_LIBRARY() calls
    find_package(PkgConfig)
    pkg_check_modules(PC_LIBHYDRASDR QUIET libhydrasdr)
  ENDIF(NOT WIN32)

  FIND_PATH(LIBHYDRASDR_INCLUDE_DIR
    NAMES hydrasdr.h
    HINTS $ENV{LIBHYDRASDR_DIR}/include ${PC_LIBHYDRASDR_INCLUDEDIR}
    PATHS /usr/local/include/libhydrasdr /usr/include/libhydrasdr /usr/local/include
    /usr/include ${CMAKE_SOURCE_DIR}/../libhydrasdr/src
    /opt/local/include/libhydrasdr
    ${LIBHYDRASDR_INCLUDE_DIR}
  )

  set(libhydrasdr_library_names hydrasdr)

  FIND_LIBRARY(LIBHYDRASDR_LIBRARIES
    NAMES ${libhydrasdr_library_names}
    HINTS $ENV{LIBHYDRASDR_DIR}/lib ${PC_LIBHYDRASDR_LIBDIR}
    PATHS /usr/local/lib /usr/lib /opt/local/lib ${PC_LIBHYDRASDR_LIBDIR} ${PC_LIBHYDRASDR_LIBRARY_DIRS} ${CMAKE_SOURCE_DIR}/../libhydrasdr/src
  )

  if(LIBHYDRASDR_INCLUDE_DIR)
    set(CMAKE_REQUIRED_INCLUDES ${LIBHYDRASDR_INCLUDE_DIR})
  endif()

  if(LIBHYDRASDR_LIBRARIES)
    set(CMAKE_REQUIRED_LIBRARIES ${LIBHYDRASDR_LIBRARIES})
  endif()

  include(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBHYDRASDR DEFAULT_MSG LIBHYDRASDR_LIBRARIES LIBHYDRASDR_INCLUDE_DIR)

  MARK_AS_ADVANCED(LIBHYDRASDR_INCLUDE_DIR LIBHYDRASDR_LIBRARIES)

endif (LIBHYDRASDR_INCLUDE_DIR AND LIBHYDRASDR_LIBRARIES)