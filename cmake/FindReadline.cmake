# - Try to find readline include dirs and libraries 
#
# Usage of this module as follows:
#
#     find_package(Readline)
#
# Variables used by this module, they can change the default behaviour and need
# to be set before calling find_package:
#
#  Readline_ROOT_DIR         Set this variable to the root installation of
#                            readline if the module has problems finding the
#                            proper installation path.
#
# Variables defined by this module:
#
#  READLINE_FOUND            System has readline, include and lib dirs found
#  Readline_INCLUDE_DIRS     The readline include directories. 
#  Readline_LIBRARIES        The readline library.

find_path(Readline_ROOT_DIR
    NAMES include/readline/readline.h
)

find_path(Readline_INCLUDE_DIR
    NAMES readline/readline.h
    HINTS ${Readline_ROOT_DIR}/include
)

set(Readline_INCLUDE_DIRS ${Readline_INCLUDE_DIR})

find_library(Readline_LIBRARY
    NAMES readline
    HINTS ${Readline_ROOT_DIR}/lib
)
set(Readline_LIBRARIES ${Readline_LIBRARY})

if(Readline_INCLUDE_DIR AND Readline_LIBRARY AND Ncurses_LIBRARY)
  set(READLINE_FOUND TRUE)
else(Readline_INCLUDE_DIR AND Readline_LIBRARY AND Ncurses_LIBRARY)
  FIND_LIBRARY(Readline_LIBRARY NAMES readline)
  include(FindPackageHandleStandardArgs)
  FIND_PACKAGE_HANDLE_STANDARD_ARGS(Readline DEFAULT_MSG Readline_LIBRARY Readline_INCLUDE_DIR  )
  MARK_AS_ADVANCED(Readline_INCLUDE_DIR Readline_LIBRARY)
endif(Readline_INCLUDE_DIR AND Readline_LIBRARY AND Ncurses_LIBRARY)

mark_as_advanced(
    Readline_ROOT_DIR
    Readline_INCLUDE_DIRS
    Readline_LIBRARIES
)
