
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

 int main() {
	int num;
	int *ptr;
	int **handle;
	
	num = 14;
	ptr = (int *)malloc(2 * sizeof(int));
	*ptr = num;
	handle = (int **)malloc(1 * sizeof(int *));
	*handle = ptr;

	// Insert extra code here
	printf("%s %p \n", "The address for num is: ", &num);
	printf("%s %p \n", "The address for ptr is: ", &ptr);
	printf("%s %p \n", "The address for handle is: ", &handle);

	return 0;
} 

