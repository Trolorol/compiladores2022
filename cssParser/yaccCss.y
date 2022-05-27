%{
#include <stdio.h>
#include <stdlib.h>

extern FILE * yyout;
char out[50];

%}

%start ficheiro


%union{
	char* text;
	int intval;
 }

%token <text> B_WORD CSSSELECTOR COLOR ALIGN_ITEMS ALIGN_CONTENT MARGIN WIDTH DISPLAY LEX_AUTO LEX_PX LEX_EM LEX_PERCENT GRID FLEX B_HEXCOLOR
%token <intval> LEX_INT


%%

ficheiro: style;

style:	B_WORD {strcpy(out,$1); printf("%s\n", out);} '{' lista_prop2 '}' 
		|	style B_WORD {strcpy(out,$2); printf("%s\n", out);} '{' lista_prop2 '}' 
		;
		

lista_prop: prop
				|	lista_prop ';' prop 
				;

lista_prop2 : lista_prop
					| lista_prop ';' 
					;
					
prop: B_WORD {strcpy(out,$1); printf("\t*%s = ", out);} ':' valpropriedade 
		;
		
valpropriedade: B_WORD {strcpy(out,$1); printf("%s\n", out);} | LEX_INT {printf("%d\n",$1);} | LEX_PX {strcpy(out,$1); printf("%s\n", out);};


%%

int yylex();

int yyerror(char* s) {
	printf("%s\n", s);
}



/* style:	B_WORD {strcpy(out,$1); printf("%s\n", out);}  '{' lista_prop '}' | style B_WORD {strcpy(out,$2); printf("%s\n", out);} '{' lista_prop '}'; */

/* lista_prop: prop ';' | lista_prop ';' prop ';'; */

/* prop: B_WORD {strcpy(out,$1); printf("\t*%s = ", out);} ':' valpropriedade; */

//Quantos $$ user em aux

	/* COLOR {strcpy(out,$1); printf("\t*%s = ", out);} |
	ALIGN_ITEMS {strcpy(out,$1); printf("\t*%s = ", out);} |
	ALIGN_CONTENT {strcpy(out,$1); printf("\t*%s = ", out);} |
	MARGIN {strcpy(out,$1); printf("\t*%s = ", out);} |
	WIDTH {strcpy(out,$1); printf("\t*%s = ", out);} |
	DISPLAY {strcpy(out,$1); printf("\t*%s = ", out);} */


/* valpropriedade: B_WORD {strcpy(out,$1); printf("%s\n", out);} | LEX_PX {strcpy(out,$1); printf("%s\n", out);} | LEX_INT {printf("%d\n",$1);} | */
/*
LEX_AUTO {strcpy(out,$1); printf("%s\n", out);} |

LEX_EM {strcpy(out,$1); printf("%s\n", out);} |
LEX_PERCENT {strcpy(out,$1); printf("%s\n", out);} |
GRID {strcpy(out,$1); printf("%s\n", out);} |
FLEX {strcpy(out,$1); printf("%s\n", out);} |
B_HEXCOLOR {strcpy(out,$1); printf("%s\n", out);} */