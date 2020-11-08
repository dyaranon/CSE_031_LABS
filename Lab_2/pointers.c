#include <stdio.h>
int main(){
	int x = 0;
	int y = 0;
	int *px, *py, *pa;
	int arr[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	printf("%s %p \n","The address of x is: ", &x);
	printf("%s %p \n","The address of y is: ", &y);
	px = &x;
	py = &y;
	pa = arr; //SAME AS pa = &arr[0]
	printf("%s %d \n","The value pointed to by px is: ", *px);
	printf("%s %p \n","The address of the pointer px is: ", &px);	
	printf("%s %d \n","The value pointed to by py is: ", *py);
	printf("%s %p \n","The address of the pointer py is: ",&py);	
	
	int i;
	for(i = 0; i < 10; i++){;
		printf("%d \n", *pa);
		pa = pa + 1;
	}
	printf("%s %p","The address of arr is: ", &arr);
return 0;
}
