#include <stdio.h>

int x, y; // variables globales
int operacion (int a, int b);
int result;

int main(){

	result = operacion (x, y);
	printf ("%d\n",result);
	return 0;
}
