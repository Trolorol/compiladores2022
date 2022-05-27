#include <stdio.h>
#include <stdlib.h>

extern FILE * yyin;
extern FILE * yyout;
int yyparse();


int main(int argc, char* argv[]) {
	if(argc<2) {
		printf("Usage: ./parser-html <input_filename>\n");
		exit(0);
	}
	yyin = fopen(argv[1], "r");
	if(!yyin) {
		printf("Could not open %s\n", argv[1]);
		exit(0);
	}
	yyout = fopen ("out.txt", "a");
        yyparse();
	fclose(yyin);
	fclose(yyout);
}
