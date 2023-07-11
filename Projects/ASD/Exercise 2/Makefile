all: bin/edit_distance_main bin/dictionary_words bin/edit_distance_tests

CFLAGS = -g -Wall -Wextra -Wpedantic -Wconversion
INCLUDES = src/*.h

COMMON_DEPS = $(INCLUDES) Makefile

obj/%.o: src/%.c $(COMMON_DEPS)
	$(CC) $(CFLAGS) -c $< -o $@

bin/dictionary_words: obj/edit_distance_dyn.o obj/dictionary_words.o obj/node_list.o obj/utils.o $(COMMON_DEPS)
	$(CC) -o bin/dictionary_words obj/edit_distance_dyn.o obj/dictionary_words.o obj/node_list.o obj/utils.o

bin/edit_distance_main: obj/edit_distance.o obj/edit_distance_dyn.o obj/edit_distance_main.o obj/utils.o $(COMMON_DEPS)
	$(CC) -o bin/edit_distance_main obj/edit_distance.o obj/edit_distance_dyn.o obj/edit_distance_main.o obj/utils.o

bin/edit_distance_tests: obj/edit_distance.o obj/edit_distance_dyn.o obj/utils.o obj/unity.o obj/edit_distance_tests.o $(COMMON_DEPS)
	$(CC) -o bin/edit_distance_tests obj/edit_distance.o obj/edit_distance_dyn.o obj/utils.o obj/edit_distance_tests.o obj/unity.o

clean:
	rm -f obj/* bin/*
