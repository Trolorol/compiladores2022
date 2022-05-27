#include <stdio.h>
#include <stdlib.h>

extern FILE * yyin;
extern FILE * yyout;
int yyparse();
int elem_type = 0;

int main(int argc, char* argv[]) {
	if(argc < 2) {
		printf("Usage: ./parser-html <input_filename>\n");
		exit(0);
	}
	yyin = fopen(argv[1], "r");
	if(!yyin) {
		printf("Could not open %s\n", argv[1]);
		exit(0);
	}
	yyout = fopen ("out.txt", "a");
	
	char choice[20];
	
	// Menu
	int valid_element = 0;
	while (!valid_element) {
		printf("What html elements would you like to extract?\n");
		printf("[text/links/images/tables/forms]: ");
		
		scanf("%19s", choice);
	
		if (strcmp(choice, "text") == 0) {
			printf("getting text...\n\n");
			elem_type = 1;
			valid_element = 1;
		} else if (strcmp(choice, "links") == 0) {
			printf("getting links...\n\n");
			elem_type = 2;
			valid_element = 1;
		} else if (strcmp(choice, "images") == 0) {
			printf("getting images...\n\n");
			elem_type = 3;
			valid_element = 1;
		} else if (strcmp(choice, "tables") == 0) {
			printf("getting tables...\n\n");
			elem_type = 4;
			valid_element = 1;
		} else if (strcmp(choice, "forms") == 0) {
			printf("getting forms...\n\n");
			elem_type = 5;
			valid_element = 1;
		} else {
			printf("invalid element\n");
		}
	}
	
    yyparse();
	fclose(yyin);
	fclose(yyout);	
}
