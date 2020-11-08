#include<stdio.h>
#include <stdlib.h>
#include<string.h>

void printArr(int *a, int size){
	//Your code here
	int k;
	printf("%s", "printArr: ");
	for(k = 0; k < size; k++){
		printf( "%d %s", *a, " ");
		a = a + 1;
	}
	
}

int* arrCopy(int *a, int size){
	//Your code here
	int* acopy = (int*)malloc(size*sizeof(int));
	int i;
	for(i = 0; i < size; i++){
		*acopy = *a;
		acopy++;
		a++;
	}
	acopy = acopy - size;
return acopy;
	
}

int main(){
    int n;
    int *arr;
    int *arr_copy;
    int i;
    printf("Enter size of array:\n");
    scanf("%d",&n);

    //Dynamically create an int array of n items
    //Your code here
	arr = (int*)malloc(n*sizeof(int));
    //Ask user to input content of array
	//Your code here
	int count = 0;
	for(i = 0; i < n; i++){
		printf("%s %d %s", "Enter array content #", i+1, ": ");
		scanf("%d", arr);
		printf("%s \n", "");
		arr = arr + 1;
	}
	arr = arr - n;
	
/*************** YOU MUST NOT MAKE CHANGES BEYOND THIS LINE! ***********/
	
	//Print original array
    printArr(arr, n);


	//Copy array
    arr_copy = arrCopy(arr, n);

	//Print new array
    printArr(arr_copy, n);

    return 0;
}
