cmake_minimum_required(VERSION 3.0)
project(syobon)
add_definitions(-DPACKAGE="open-syobon")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake")

find_package(SDL REQUIRED)
find_package(SDL_gfx REQUIRED)
find_package(SDL_image REQUIRED)
find_package(SDL_mixer REQUIRED)
find_package(SDL_ttf REQUIRED)
find_package(Intl REQUIRED)

# XXX: works better in SDL. fmod doesn't seem to mix several sounds
option(USE_FMOD "Use FMod" OFF)
if(USE_FMOD)
  add_definitions(-DUSE_FMOD)
endif()
add_definitions(-DGAMEDATA="data")

file(GLOB SYOBON_SRC_DIR "src/*.cpp")
set(SYOBON_INCLUDE_DIR "include")
add_executable(syobon ${SYOBON_SRC_DIR})

include_directories(
  ${SYOBON_INCLUDE_DIR}
  ${SDL_INCLUDE_DIR}
  ${SDL_GFX_INCLUDE_DIR}
  ${SDL_IMAGE_INCLUDE_DIR}
  ${SDL_MIXER_INCLUDE_DIR}
  ${SDL_TTF_INCLUDE_DIR}
  ${Intl_INCLUDE_DIR}
)
target_link_libraries(
  syobon
  ${SDL_LIBRARY}
  ${SDL_GFX_LIBRARY}
  ${SDL_IMAGE_LIBRARY}
  ${SDL_MIXER_LIBRARY}
  ${SDL_TTF_LIBRARY}
  ${Intl_LIBRARY}
)
file(COPY "${PROJECT_SOURCE_DIR}/data" DESTINATION "${GAMEDATA}")
