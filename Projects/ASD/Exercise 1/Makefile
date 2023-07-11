all: bin/node_list_main bin/node_list_tests bin/array_list_main bin/array_list_tests

CFLAGS = -g -Wall -Wextra -Wpedantic -Wconversion

INCLUDES = src/*.h

COMMON_DEPS = $(INCLUDES) Makefile

obj/%.o: src/%.c $(COMMON_DEPS)
	$(CC) $(CFLAGS) -c $< -o $@

# Compiling rule to make main using node implementation of the list
bin/node_list_main: obj/node_list.o obj/main.o obj/list_merge.o $(COMMON_DEPS)
	$(CC) -o bin/node_list_main obj/node_list.o obj/main.o obj/list_merge.o

# Compiling rule to make test suite using node implementation of the list
bin/node_list_tests: obj/list_tests.o obj/node_list.o obj/unity.o $(COMMON_DEPS)
	$(CC) -o bin/node_list_tests  obj/list_tests.o obj/node_list.o obj/unity.o

# Compiling rule to make main using array implementation of the list
bin/array_list_main: obj/array_list.o obj/main.o obj/list_merge.o $(COMMON_DEPS)
	$(CC) -o bin/array_list_main obj/array_list.o obj/main.o obj/list_merge.o

# Compiling rule to make main using array implementation of the list
bin/array_list_tests: obj/list_tests.o obj/array_list.o obj/unity.o $(COMMON_DEPS)
	$(CC) -o bin/array_list_tests  obj/list_tests.o obj/array_list.o obj/unity.o

clean:
	rm -f obj/* bin/*
