CC=gcc
DEPS = config.h semutils.h utils.h stack.h studutils.h list.h
OBJ = ./obj
BIN = ./bin
VPATH = src:src/gestore:src/student:src/shared
CFLAGS = -lm -Wall

all: gestore student

$(OBJ)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

gestore: $(OBJ)/gestore.o $(OBJ)/config.o $(OBJ)/utils.o $(OBJ)/semutils.o $(OBJ)/list.o
	$(CC) -o $(BIN)/gestore $(OBJ)/gestore.o $(OBJ)/config.o $(OBJ)/utils.o $(OBJ)/semutils.o $(OBJ)/list.o $(CFLAGS)

student: $(OBJ)/student.o $(OBJ)/semutils.o $(OBJ)/stack.o $(OBJ)/utils.o $(OBJ)/studutils.o
	$(CC) -o $(BIN)/student $(OBJ)/student.o $(OBJ)/utils.o $(OBJ)/semutils.o $(OBJ)/stack.o $(OBJ)/studutils.o $(CFLAGS)

run:
	$(BIN)/gestore

.PHONY: clean
clean:
	rm $(OBJ)/*.o
