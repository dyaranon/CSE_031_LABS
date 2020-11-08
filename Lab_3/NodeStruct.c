
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

struct Node {
    int iValue;
    float fValue ;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;
	
	// Insert extra code here
	printf("%s %p \n", "The address of the head pointer is: ", &head);
	printf("%s %p \n", "The address of what head is pointing to is: ",  &(*head));
	printf("%s %d %s %f \n", "The value of iValue and fValue respectively is: ", (head->iValue), " and ", (head->fValue));
	printf("%s %p %s %p %s %p \n", "The address of iValue, fValue, and next (pointed to by head) respectively is :", &(head->iValue), " and ", &(head->fValue), " and ", &(head->next));
 
	
	return 0;
}
