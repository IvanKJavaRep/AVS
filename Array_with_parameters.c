#include <stdio.h>

int sum_pairs(int n, int a[], int b[]){
	for (int i = 0; i<n-1; i++)
		b[i]=a[i]+a[i+1];
	return n-1;
}

int main()
{
	int a[999]; // объявлен массив a из n элементов
	int b[998];
	int i;
	int n;
    scanf("%d", &n);
	// Ввод элементов массива
	for (i = 0; i<n; i++) 
		scanf("%d", &a[i]);
	int n2 = sum_pairs(n, a, b);
	// Вывод элементов массива
	for (i = 0; i<n2; i++)
		printf("%d ", b[i]);
	return 0;
}
