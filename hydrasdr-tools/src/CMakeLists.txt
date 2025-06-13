# Copyright 2012 Jared Boone
# Copyright 2013-2025 Benjamin Vernoux
#
# This file is part of HydraSDR (based on HackRF project).
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
#

# Based heavily upon the libftdi cmake setup.

set(INSTALL_DEFAULT_BINDIR "bin" CACHE STRING "Appended to CMAKE_INSTALL_PREFIX")

if(MSVC)
add_library(libgetopt_static STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/../getopt/getopt.c
)
endif()

add_executable(hydrasdr_gpio hydrasdr_gpio.c)
install(TARGETS hydrasdr_gpio RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_gpiodir hydrasdr_gpiodir.c)
install(TARGETS hydrasdr_gpiodir RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_lib_version hydrasdr_lib_version.c)
install(TARGETS hydrasdr_lib_version RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_si5351c hydrasdr_si5351c.c)
install(TARGETS hydrasdr_si5351c RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_r82x hydrasdr_r82x.c)
install(TARGETS hydrasdr_r82x RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_spiflash hydrasdr_spiflash.c)
install(TARGETS hydrasdr_spiflash RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_calibrate hydrasdr_calibrate.c)
install(TARGETS hydrasdr_calibrate RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_info hydrasdr_info.c)
install(TARGETS hydrasdr_info RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_rx hydrasdr_rx.c)
install(TARGETS hydrasdr_rx RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_reset hydrasdr_reset.c)
install(TARGETS hydrasdr_reset RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

add_executable(hydrasdr_set_rf_port hydrasdr_set_rf_port.c)
install(TARGETS hydrasdr_set_rf_port RUNTIME DESTINATION ${INSTALL_DEFAULT_BINDIR})

if(NOT libhydrasdr_SOURCE_DIR)
include_directories(${LIBHYDRASDR_INCLUDE_DIR})
LIST(APPEND TOOLS_LINK_LIBS ${LIBHYDRASDR_LIBRARIES})
else()
LIST(APPEND TOOLS_LINK_LIBS hydrasdr)
endif()

if(MSVC)
LIST(APPEND TOOLS_LINK_LIBS libgetopt_static)
endif()

target_link_libraries(hydrasdr_gpio ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_gpiodir ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_lib_version ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_si5351c ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_r82x ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_spiflash ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_calibrate ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_info ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_rx ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_reset ${TOOLS_LINK_LIBS})
target_link_libraries(hydrasdr_set_rf_port ${TOOLS_LINK_LIBS})
