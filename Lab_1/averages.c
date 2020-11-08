#include <stdio.h>
int main(){
	int positive_average, negative_average, num, negativeInts, positiveInts, negativeSum, positiveSum;
	negativeInts = 0;
	positiveInts = 0;
	negativeSum = 0;
	positiveSum = 0;
	printf("Please enter an integer: ");
	scanf("%d", &num);
	while(num != 0){
		if(num < 0){
			negativeSum = negativeSum + num;
			negativeInts++;
		}
		else if (num > 0){
			positiveSum = positiveSum + num;
			positiveInts++;
		}
		printf("Please enter an integer: ");
		scanf("%d", &num);
	}
	negative_average = (negativeSum) / (negativeInts);
	positive_average = (positiveSum) / (positiveInts);
	printf("Positive average: %d ", positive_average);
	printf("Negative average: %d", negative_average);

return 0;
}	
		


		
	
	
