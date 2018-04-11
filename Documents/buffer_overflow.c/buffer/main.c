#include <stdio.h>

void secretFunction(){
	printf("You have entered a restricted area!!\n");
	printf("Pawned!!");
	
}

void echo(){
	char buffer[5];
	printf("Enter some text:\n");
	scanf("%s", buffer);
	printf("You entered: %s\n", buffer);
	
}

int main(){
	echo();
	return 0;
	
}
