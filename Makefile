
# Type 'make GCW0=1' to build for GCW-Zero

#GCW0 = 1

APP_NAME = supertux

# compiler

ifdef GCW0
    CC = mipsel-linux-g++
else
    CC = g++
endif 

CXXDEFS = -DGP2X -DRES320X240 -DNOOPENGL -DHAVE_SOUND

CXXFLAGS = $(CXXDEFS) -Wall -O2 -std=gnu++03 `sdl-config --cflags`
CXXLIBS = -s -lz -lSDL -lSDL_mixer -lSDL_gfx -lSDL_image

ifdef GCW0
    CXXFLAGS += -mips32
endif

# source files

OBJ =	src/badguy.o \
	src/bitmask.o \
	src/button.o \
	src/collision.o \
	src/configfile.o \
	src/intro.o \
	src/gameloop.o \
	src/globals.o \
	src/high_scores.o \
	src/level.o \
	src/leveleditor.o \
	src/lispreader.o \
	src/menu.o \
	src/particlesystem.o \
	src/physic.o \
	src/player.o \
	src/scene.o \
	src/screen.o \
	src/setup.o \
	src/special.o \
	src/supertux.o \
	src/text.o \
	src/texture.o \
	src/timer.o \
	src/title.o \
	src/type.o \
	src/world.o \
	src/worldmap.o \
	src/tile.o \
	src/mousecursor.o \
	src/resources.o \
	src/gameobjs.o \
	src/sprite.o \
	src/sprite_manager.o \
	src/music_manager.o \
	src/musicref.o \
	src/sound.o

all : $(APP_NAME)

$(APP_NAME) : $(OBJ)
	$(CC) $^ $(CXXLIBS) -o $@

%.o : %.cpp
	$(CC) -c $(CXXFLAGS) $< -o $@

clean :
	rm -rf src/*.o $(APP_NAME)