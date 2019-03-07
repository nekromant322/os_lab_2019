gcc main.c -o main

./main

gcc -c revert_string.c -o RevertString.o

gcc -c -fPIC revert_string.c -o RevertString.o
Анатолий
вчера в 23:39
ar rcs lib_revert.a RevertString.o
Анатолий
вчера в 23:44
gcc -c main.c -o main.o
gcc main.o -L -lib_revert -o statically-linked




gcc -shared Re
vertString.o -o libdyn.so

gcc main.o -L
 -ldyn -o shared-library


export LD_LIBRARY_PATH=/projects/nekromant322-os_lab_2019/lab2/src/revert_string

./shared-library

//gcc -shared RevertString.o -o libdyn.so
//gcc main.o -L -ldyn -o shared-library
//gcc -o test tests/tests.c -lcunit -L