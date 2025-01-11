cmake_minimum_required(VERSION 3.10)

##################################################
## Project
##################################################
set(CURRENT_TARGET_NAME "smolv")
project(${CURRENT_TARGET_NAME})

##################################################
## Includes
##################################################
include_directories(${CMAKE_CURRENT_SOURCE_DIR})	# The current source directory
#set(PUBLIC_HDR_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../source)
#set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../source)

##################################################
## Source codes
##################################################
#set(SRCS
#  ${SRC_DIR}/smolv.cpp
#  )
set(CURRENT_SRC
  "source/smolv.cpp"
)


##################################################
## Shared libraries
##################################################
set(CURRENT_SHARED_LIBRARIES
  # Not required in this project
  )


##################################################
## Build
##################################################
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x -ffor-scope -fno-rtti -fno-exceptions -pipe -ffunction-sections -fdata-sections -ffast-math -Wnon-virtual-dtor -Wreorder -Wsign-promo -fvisibility=hidden -fvisibility-inlines-hidden -Wstrict-null-sentinel -Os -funroll-all-loops -fpeel-loops -ftree-vectorize")
set(LINKER_FLAGS "${LINKER_FLAGS} -Wl,--as-needed -Wl,--gc-sections -Wl,--no-undefined -Wl,--strip-all")
if(ANDROID)
  set(LINKER_FLAGS "${LINKER_FLAGS} -Wl,-rpath-link=${ANDROID_NDK_SYSROOT}/usr/lib/ -L${ANDROID_NDK_SYSROOT}/usr/lib/")
endif()
add_library(${CURRENT_TARGET_NAME} STATIC ${CURRENT_SRC})
#target_link_libraries(${CURRENT_TARGET_NAME} ${CURRENT_SHARED_LIBRARIES})
#set_target_properties(${CURRENT_TARGET_NAME} PROPERTIES COMPILE_DEFINITIONS "__STDC_INT64__")

if (NOT MSVC)
  target_compile_options(${CURRENT_TARGET_NAME} PRIVATE -Wno-tautological-unsigned-enum-zero-compare)
endif()
target_include_directories(${CURRENT_TARGET_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
install(TARGETS ${CURRENT_TARGET_NAME} ARCHIVE DESTINATION lib/${DIST_DIR})

##################################################
## Install
##################################################
install(TARGETS ${CURRENT_TARGET_NAME}
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/source/smolv.h
  DESTINATION include
  )


#add_library(${TARGET} STATIC ${SRCS})
#target_compile_options(${TARGET} PRIVATE
#  $<$<PLATFORM_ID:Linux>:-fPIC>
#  )
