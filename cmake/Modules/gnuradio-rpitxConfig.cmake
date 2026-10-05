find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_RPITX gnuradio-rpitx)

FIND_PATH(
    GR_RPITX_INCLUDE_DIRS
    NAMES gnuradio/rpitx/api.h
    HINTS $ENV{RPITX_DIR}/include
        ${PC_RPITX_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_RPITX_LIBRARIES
    NAMES gnuradio-rpitx
    HINTS $ENV{RPITX_DIR}/lib
        ${PC_RPITX_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-rpitxTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_RPITX DEFAULT_MSG GR_RPITX_LIBRARIES GR_RPITX_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_RPITX_LIBRARIES GR_RPITX_INCLUDE_DIRS)
