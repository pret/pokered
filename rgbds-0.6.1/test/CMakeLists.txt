
add_executable(randtilegen gfx/randtilegen.c)

add_executable(rgbgfx_test gfx/rgbgfx_test.cpp)

install(TARGETS randtilegen rgbgfx_test DESTINATION ${rgbds_SOURCE_DIR}/test/gfx)

foreach(TARGET randtilegen rgbgfx_test)
  if(LIBPNG_FOUND) # pkg-config
    target_include_directories(${TARGET} PRIVATE ${LIBPNG_INCLUDE_DIRS})
    target_link_directories(${TARGET} PRIVATE ${LIBPNG_LIBRARY_DIRS})
    target_link_libraries(${TARGET} PRIVATE ${LIBPNG_LIBRARIES})
  else()
    target_compile_definitions(${TARGET} PRIVATE ${PNG_DEFINITIONS})
    target_include_directories(${TARGET} PRIVATE ${PNG_INCLUDE_DIRS})
    target_link_libraries(${TARGET} PRIVATE ${PNG_LIBRARIES})
  endif()
endforeach()
