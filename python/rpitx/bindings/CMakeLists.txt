# Copyright 2020 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Check if there is C++ code at all
########################################################################
if(NOT rpitx_sources)
    MESSAGE(STATUS "No C++ sources... skipping python bindings")
    return()
endif(NOT rpitx_sources)

########################################################################
# Check for pygccxml
########################################################################
GR_PYTHON_CHECK_MODULE_RAW(
    "pygccxml"
    "import pygccxml"
    PYGCCXML_FOUND
    )

include(GrPybind)

########################################################################
# Python Bindings
########################################################################

list(APPEND rpitx_python_files
    rpitx_sink_python.cc python_bindings.cc)

GR_PYBIND_MAKE_OOT(rpitx
   ../../..
   gr::rpitx
   "${rpitx_python_files}")

# copy bindings extension for use in QA test module
add_custom_command(TARGET rpitx_python POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:rpitx_python>
    ${PROJECT_BINARY_DIR}/test_modules/gnuradio/rpitx/
)

install(TARGETS rpitx_python DESTINATION ${GR_PYTHON_DIR}/gnuradio/rpitx COMPONENT pythonapi)
