#
# This file is part of RGBDS.
#
# Copyright (c) 2020 RGBDS contributors.
#
# SPDX-License-Identifier: MIT
#

configure_file(version.c _version.c ESCAPE_QUOTES)

set(common_src
    "error.c"
    "extern/getopt.c"
    "_version.c"
    )

find_package(BISON 3.0.0 REQUIRED)
set(BISON_FLAGS "-Wall")
# Set some optimization flags on versions that support them
if(BISON_VERSION VERSION_GREATER_EQUAL "3.5")
  set(BISON_FLAGS "${BISON_FLAGS} -Dapi.token.raw=true")
endif()
if(BISON_VERSION VERSION_GREATER_EQUAL "3.6")
  set(BISON_FLAGS "${BISON_FLAGS} -Dparse.error=detailed")
else()
  set(BISON_FLAGS "${BISON_FLAGS} -Dparse.error=verbose")
endif()
set(BISON_FLAGS "${BISON_FLAGS} -Dparse.lac=full")
set(BISON_FLAGS "${BISON_FLAGS} -Dlr.type=ielr")

BISON_TARGET(PARSER "asm/parser.y"
             "${PROJECT_SOURCE_DIR}/src/asm/parser.c"
             COMPILE_FLAGS "${BISON_FLAGS}"
             DEFINES_FILE "${PROJECT_SOURCE_DIR}/src/asm/parser.h"
             )

set(rgbasm_src
    "${BISON_PARSER_OUTPUT_SOURCE}"
    "asm/charmap.c"
    "asm/fixpoint.c"
    "asm/format.c"
    "asm/fstack.c"
    "asm/lexer.c"
    "asm/macro.c"
    "asm/main.c"
    "asm/opt.c"
    "asm/output.c"
    "asm/rpn.c"
    "asm/section.c"
    "asm/symbol.c"
    "asm/util.c"
    "asm/warning.c"
    "extern/utf8decoder.c"
    "hashmap.c"
    "linkdefs.c"
    "opmath.c"
    )

set(rgbfix_src
    "fix/main.c"
    )

set(rgbgfx_src
    "gfx/main.cpp"
    "gfx/pal_packing.cpp"
    "gfx/pal_sorting.cpp"
    "gfx/pal_spec.cpp"
    "gfx/process.cpp"
    "gfx/proto_palette.cpp"
    "gfx/reverse.cpp"
    "gfx/rgba.cpp"
    "extern/getopt.c"
    "error.c"
    )

set(rgblink_src
    "link/assign.c"
    "link/main.c"
    "link/object.c"
    "link/output.c"
    "link/patch.c"
    "link/script.c"
    "link/sdas_obj.c"
    "link/section.c"
    "link/symbol.c"
    "extern/utf8decoder.c"
    "hashmap.c"
    "linkdefs.c"
    "opmath.c"
    )

foreach(PROG "asm" "fix" "gfx" "link")
  add_executable(rgb${PROG}
                 ${rgb${PROG}_src}
                 ${common_src}
                 )
  install(TARGETS rgb${PROG} RUNTIME DESTINATION bin)
endforeach()

if(LIBPNG_FOUND) # pkg-config
  target_include_directories(rgbgfx PRIVATE ${LIBPNG_INCLUDE_DIRS})
  target_link_directories(rgbgfx PRIVATE ${LIBPNG_LIBRARY_DIRS})
  target_link_libraries(rgbgfx PRIVATE ${LIBPNG_LIBRARIES})
else()
  target_compile_definitions(rgbgfx PRIVATE ${PNG_DEFINITIONS})
  target_include_directories(rgbgfx PRIVATE ${PNG_INCLUDE_DIRS})
  target_link_libraries(rgbgfx PRIVATE ${PNG_LIBRARIES})
endif()

include(CheckLibraryExists)
check_library_exists("m" "sin" "" HAS_LIBM)
if(HAS_LIBM)
  target_link_libraries(rgbasm PRIVATE "m")
endif()
