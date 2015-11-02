cmake_minimum_required(VERSION 3.0)
project(syobon)
add_definitions(-DPACKAGE="open-syobon")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake")

find_package(SDL REQUIRED)
find_package(SDL_gfx REQUIRED)
find_package(SDL_image REQUIRED)
find_package(SDL_mixer REQUIRED)
find_package(SDL_ttf REQUIRED)
find_package(GettextTools REQUIRED)
# TODO: check if glibc is used since it comes with libintl.h
find_package(Intl REQUIRED)

# XXX: works better in SDL. fmod doesn't seem to mix several sounds
option(USE_FMOD "Use FMod" OFF)
if(USE_FMOD)
  add_definitions(-DUSE_FMOD)
endif()
add_definitions(-DGAMEDATA="data")

file(GLOB SYOBON_SRC_DIR "src/*.cpp")
set(SYOBON_INCLUDE_DIR "include")

set(GETTEXT_STOCK_DIR "${PROJECT_SOURCE_DIR}/lang")
set(GETTEXT_LANG_DIR "${CMAKE_CURRENT_BINARY_DIR}/lang")
set(GETTEXT_OUT_DIR "${CMAKE_CURRENT_BINARY_DIR}/locale")
add_definitions(-DLOCALEDIR="./locale/")
gettext_make_target(
  "lang"
  HIERARCHY "{1}/{2}/{3}/{4}.mo"
  KEYWORDS "_"
  DOMAIN "open-syobon"
  STOCK_DIR ${GETTEXT_STOCK_DIR}
  LANG_DIR ${GETTEXT_LANG_DIR}
  OUT_DIR ${GETTEXT_OUT_DIR}
  SOURCE ${SYOBON_SRC_DIR}
)

include_directories(
  ${SYOBON_INCLUDE_DIR}
  ${SDL_INCLUDE_DIR}
  ${SDL_GFX_INCLUDE_DIR}
  ${SDL_IMAGE_INCLUDE_DIR}
  ${SDL_MIXER_INCLUDE_DIR}
  ${SDL_TTF_INCLUDE_DIR}
  ${INTL_INCLUDE_DIR}
)

add_executable(syobon ${SYOBON_SRC_DIR})

target_link_libraries(
  syobon
  ${INTL_LIBRARY}
  ${SDL_LIBRARY}
  ${SDL_GFX_LIBRARY}
  ${SDL_IMAGE_LIBRARY}
  ${SDL_MIXER_LIBRARY}
  ${SDL_TTF_LIBRARY}
)
file(COPY "${PROJECT_SOURCE_DIR}/data" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
