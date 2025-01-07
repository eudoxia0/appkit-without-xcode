CC=clang
CFLAGS=-fobjc-arc
LDFLAGS=-framework AppKit

APP_NAME=Hello.app
APP_CONTENTS=$(APP_NAME)/Contents
APP_MACOS=$(APP_CONTENTS)/MacOS
APP_RESOURCES=$(APP_CONTENTS)/Resources

all: $(APP_NAME)

$(APP_NAME): build/program Info.plist
	mkdir -p $(APP_MACOS)
	mkdir -p $(APP_RESOURCES)
	cp build/program $(APP_MACOS)/
	cp Info.plist $(APP_CONTENTS)/

build/program: build/main.o
	$(CC) $(LDFLAGS) build/main.o -o build/program

build/main.o: main.m
	mkdir -p build
	$(CC) $(CFLAGS) -c main.m -o build/main.o

clean:
	rm -rf build/
	rm -rf $(APP_NAME)

run: all
	open $(APP_NAME)

.PHONY: all clean run
