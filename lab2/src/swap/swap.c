#include "swap.h"

void Swap(char *left, char *right)
{
	char buf = left[0];
	left[0] = right[0];
	right[0] = buf;
}
