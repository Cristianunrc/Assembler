#include <stdio.h>

void sumarDiez (int, int *);

int main(void) {
	
	int num, result;

	printf ("Ingresar un numero: ");
	scanf ("%d",&num);
	sumarDiez (num, &result);
	printf ("El resultado es: %d",result);

	return 0;
}
