#include <stdio.h>

int maxBars(int price, int numWraps, int money);
int newBars(int numBars, int numWraps);

int main(){
	
	int price; 
	int numWraps; //number of candy bar wrappers
	int money;
	
	printf("Welcome to BobCat Candy, home to the famous BobCat Bars! \n");
	
	printf("Enter the price of each BobCat Bar: ");
	scanf("%d", &price);
	printf("\n");
	
	printf("Enter the number of wrappers needed to exchange for new bar: ");
	scanf("%d", &numWraps);
	printf("\n");
	
	printf("How much money do you have? ");
	scanf("%d", &money);
	printf("\n");
		
	printf("Good! Let me run the numbers ... \n");

	if(money < price){
		printf("With $");
		printf("%d", money);
		printf(" you will receive a maximum of 0 BobCat Bars! \n");
	}
	else{
		int max = maxBars(price, numWraps, money); //calculates maximum amount of bars given the information, recursive
		printf("With $");
		printf("%d", money);
		printf(" you will receive a maximum of ");
		printf("%d", max);
		printf(" BobCar Bars!\n");
	}
}

int maxBars(int price, int numWraps, int money){
	
	int numBars = (money / price);
	printf("First, you buy ");
	printf("%d", numBars);
	printf(" bars. \n");
	
	int max = newBars(numBars, numWraps);
	
return numBars + max;
}

int newBars(int numBars, int numWraps){
	
	if (numWraps == 0){
		printf("We are not offering the wrapper deal at this time. \n");
		return 0;
	}

	else if (numWraps == 1){
		printf("Come back anytime for endless exchanges of candy bars!");
		return 0;
	}
////////////////////////////////////////////////////////////////////////////
	else if(numBars < numWraps){
		return 0;
	}

	else{
		printf("Then you will get another ");
		printf("%d", (numBars / numWraps));
		printf(" bars.\n");
		numBars = numBars / numWraps;
		return numBars + newBars(numBars, numWraps);
	}
} 