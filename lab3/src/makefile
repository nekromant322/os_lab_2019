CC=gcc
CFLAGS=-I.
n5 : 
	$(CC) -o n5.o -c n5.c $(CFLAGS)
	$(CC) -o n5 n5.o $(CFLAGS)
all : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o sequential_min_max find_min_max.o utils.o sequential_min_max.c $(CFLAGS)
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)
	$(CC) -o utils.o -c utils.c $(CFLAGS)
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)
sequential_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o sequential_min_max find_min_max.o utils.o sequential_min_max.c $(CFLAGS)

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

clean :
	rm utils.o find_min_max.o sequential_min_max parallel_min_max
