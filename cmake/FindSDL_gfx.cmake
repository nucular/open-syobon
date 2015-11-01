FIND_PATH(
  SDL_GFX_INCLUDE_DIR
  NAMES
    SDL_gfxPrimitives.h
    SDL_gfxBlitFunc.h
    # ...
  HINTS
    ${SDL_ROOT}/include
    ${SDL_GFX_ROOT}/include
    $ENV{SDL_ROOT}/include
    $ENV{SDL_GFX_ROOT}/include
  PATH_SUFFIXES
    SDL
    SDL_gfx
    include/SDL include/SDL12 include/SDL11 include
)

FIND_LIBRARY(
  SDL_GFX_LIBRARY
  NAMES
    SDL_gfx libSDL_gfx
  HINTS
    ${SDL_ROOT}/lib
    ${SDL_GFX_ROOT}/lib
    $ENV{SDL_ROOT}/lib
    $ENV{SDL_GFX_ROOT}/lib
  PATH_SUFFIXES
    SDL
    SDL_gfx
)

SET(SDL_GFX_LIBRARIES ${SDL_GFX_LIBRARY})
SET(SDL_GFX_INCLUDE_DIRS ${SDL_GFX_INCLUDE_DIR})

INCLUDE (FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(SDL_gfx REQUIRED_VARS SDL_GFX_LIBRARY SDL_GFX_INCLUDE_DIR)
