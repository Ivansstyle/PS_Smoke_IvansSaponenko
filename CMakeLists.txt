cmake_minimum_required(VERSION 3.5)

project(smoke)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCE_FILES
        src/main.cpp
        src/particlesystem.cpp
        src/particle.cpp
        src/controlsphere.cpp
        src/Vec4.cpp
        src/space.cpp
        src/flowspace.cpp
        src/controls.cpp
        src/flow.cpp
        src/Mat4.cpp
        src/GLFunctions.cpp
)

set(HEADER_FILES
        include/particlesystem.h
        include/particle.h
        include/controlsphere.h
        include/Vec4.h
        include/space.h
        include/flowspace.h
        include/controls.h
        include/flow.h
        include/Mat4.h
        include/GLFunctions.h
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

target_compile_definitions(${PROJECT_NAME} PRIVATE
        $<$<PLATFORM_ID:Linux>:__OS_LINUX__>
        $<$<PLATFORM_ID:Darwin>:__OS_OSX__>
)
# Somehow this include does not work
include_directories(/usr/opt/include/SDL2)
find_library(SDL2_LIBRARY SDL2)
find_library(SDL2_image_LIBRARY SDL2_image)
target_link_libraries(${PROJECT_NAME} PRIVATE ${SDL2_LIBRARY} ${SDL2_image_LIBRARY} "-framework OpenGL")


if(APPLE)
    include_directories(/usr/opt/include)
    find_library(SDL2_LIBRARY SDL2)
    find_library(SDL2_image_LIBRARY SDL2_image)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${SDL2_LIBRARY} ${SDL2_image_LIBRARY} "-framework OpenGL")
elseif(UNIX AND NOT APPLE)
    find_package(SDL2 REQUIRED)
    find_package(PNG REQUIRED)
    target_include_directories(${PROJECT_NAME} PRIVATE ${SDL2_INCLUDE_DIRS} /usr/include packages/obj-0.1)
    target_link_libraries(${PROJECT_NAME} PRIVATE ${SDL2_LIBRARIES} GLUT::GLUT GLU::GLU GL::GL PNG::PNG)
else()
    message(FATAL_ERROR "Unsupported platform")
endif()