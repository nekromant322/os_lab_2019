CC=gcc
CFLAGS=-I.
CURRENT_DIR=$(notdir $(patsubst %/,%,$(dir $(mkfile_path))))


libFact.so : factorial.h 
	$(CC) -c -fPIC factorial.c -o factorial.o
	$(CC) -o factorial.so -shared factorial.o

server: libFact.so
	$(CC) -c server.c -o server.o
	$(CC) -o server server.o -L$(shell pwd) -lFact -pthread -Wl,-rpath=$(shell pwd) $(CFLAGS)

client: libFact.so
	$(CC) -c client.c -o client.o
	$(CC) -o client client.o -L$(shell pwd) -lFact -pthread -Wl,-rpath=$(shell pwd) $(CFLAGS)

all: libFact client server

clean :
	rm utils.o find_min_max.o sequential_min_max parallel_min_max
clean_o:
	$(shell rm ./*.o)