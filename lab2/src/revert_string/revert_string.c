#include "revert_string.h"
#include <string.h>

void RevertString(char *str)
{
	for ( int i = 0; i < strlen(str)/2;i++)
	{
	    char temp = str[i];
	    str[i] = str[strlen(str)-i-1];
	    str[strlen(str)-i-1] = temp;
	}
}
//gcc -shared RevertString.o -o libdyn.so
//gcc main.o -L -ldyn -o shared-library
//gcc -o test tests/tests.c -lcunit -L