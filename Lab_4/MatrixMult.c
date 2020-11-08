
#include <stdio.h>
#include <malloc.h>

int** matMult(int **a, int **b, int size){
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
	
	int i, j, k, value;
	int **c = (int**)malloc(size * sizeof(int*)); //allocates speace in memory for an array of pointers (coulmns)
	for(i = 0; i < size; i++){
		*(c + i) = (int*)malloc(size * sizeof(int)); //Every coulumn holds a pointer to an array of size n, 2D Array
	}
	
	for(i = 0; i < size; i++){
		for(j = 0; j < size; j++){
			value = 0;
			for(k = 0; k < size; k++){
			 value = value + *(*(a + k) + j) * *(*(b + k) + j);
			}
		*(*(c + i) + j) = value;
		}
	}

return c;

}

void printArray(int **arr, int n){
	// (2) Implement your printArray function here
	int i, j;
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
		printf("%d", *(*(arr + i) + j));
		}
		printf("\n");
	} 

}

int main() {
	int n = 2;
	int i, j, val = 0;
	int* temp;  
	int **matA, **matB, **matC;
	// (1) Define 2 n x n arrays (matrices). 
	int **arr1 = (int**)malloc(n * sizeof(int*));
	int **arr2 = (int**)malloc(n * sizeof(int*));
	
	for(i = 0; i < n; i++){
		*(arr1 + i) = (int*)malloc(n*sizeof(int));
		*(arr2 + i) = (int*)malloc(n*sizeof(int));
		for(j = 0; j < n; j++){
			*(*(arr1 + i) + j) = 3;
			*(*(arr2 + i) + j) = 5;
		}
	}


	// (3) Call printArray to print out the 2 arrays here.
	printArray(arr1, n);
	printf("\n");
	printArray(arr2, n);
	
	//(5) Call matMult to multiply the 2 arrays here.
	matC = matMult(arr1, arr2, n);
	printf("\n");
	
	//(6) Call printArray to print out resulting array here.
	printArray(matC, n);


    return 0;
}
