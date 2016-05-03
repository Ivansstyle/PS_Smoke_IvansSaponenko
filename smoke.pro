TEMPLATE = app
CONFIG += console
CONFIG += debug
CONFIG += c++11


TARGET = smoke
SOURCES += src/main.cpp \
    src/particlesystem.cpp \
    src/particle.cpp \
    src/controlsphere.cpp \
    src/Vec4.cpp \
    src/space.cpp \
    src/flowspace.cpp \
    src/controls.cpp \
    src/flow.cpp \
    src/Mat4.cpp \
    src/GLFunctions.cpp

HEADERS += \
    include/particlesystem.h \
    include/particle.h \
    include/controlsphere.h \
    include/Vec4.h \
    include/space.h \
    include/flowspace.h \
    include/controls.h \
    include/flow.h \
    include/Mat4.h \
    include/GLFunctions.h

OBJECTS_DIR = obj

QMAKE_CFLAGS += -std=c++11



# Multiplatform : Linux

unix:linux{
  INCLUDEPATH += . /usr/include packages/obj-0.1
  LIBS += -lSDL2 -lglut -lGLU -lGL -lpng
  DEFINES += __OS_LINUX__
          }





# Multiplatform : Mac OsX
macx{
  DEFINES += __OS_OSX__
  LIBS += -F/Library/Frameworks -framework SDL2
  LIBS += -F/Library/Frameworks -framework SDL2_image
  INCLUDEPATH  += Library/Frameworks/SDL.framework/Headers
  INCLUDEPATH  += /usr/local/include
  INCLUDEPATH  += /usr/local/include/SDL2
  INCLUDEPATH  += /Library/Frameworks/SDL2_image.framework/Headers
  QMAKE_LFLAGS += -F/Library/Frameworks

  LIBS += -framework OpenGL
    }

QMAKE_CFLAGS += -std=c++11

