#include <stdio.h>
#include <limits.h>

extern int getDivisorCount1(unsigned value);
extern void getDivisorCount2(int value, int* result);

int main()
{
	long long int i; // Zahlenwert der geprueft wird
	printf("Bitte eine ganzzahlige Zahl eingeben.\n");
	scanf("%lli", &i);

	if (i < 0)
	{
		i = -i;
	}

	if (i > UINT_MAX)
	{
		printf("Zu große Eingabe!\n");
		return 0;
	}

	int r2 = 0; // Ergebnis der 2. Funktion wird hier reingeschrieben

	printf("1.Funktion (ohne Basiszeiger): %d\n", getDivisorCount1(i));	
	getDivisorCount2(i, &r2);
	printf("2.Funktion (mit Basiszeiger): %d\n", r2);

	return 0;
}
