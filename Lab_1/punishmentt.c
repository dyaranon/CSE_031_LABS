#include <stdio.h>
int check(int num){
	if (num < 0){
		printf("You entered an incorrect value for the number of lines! ");
		return 0;
	}
return 1;
}

int main(){
	int numSentences, typo, check1, check2;
	printf("Enter the number of lines for punishment: ");
	scanf("%d", &numSentences);
	check1 = check(numSentences);
	if(check1 == 1){
		printf("Enter the line for which we want to make a typo: " );
		scanf("%d", &typo);
		check2 = check(typo);
		if(check2 == 1){
			int i;
			for (i = 1; i < numSentences + 1; i++){
				if (i == typo){
					printf("C programming language is the bet! ");
				}
				else{
					printf("C programming language is the best! ");
				}
			}
		}
	}
	return 0;
}
