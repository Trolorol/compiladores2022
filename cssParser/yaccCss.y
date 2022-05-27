%{
#include <stdio.h>
#include <stdlib.h>
extern FILE * yyout;
char out[50];
int contC=0;
int contL=0;
%}

%start file


%union{
	char* text;
	int intval;
 }

%type <intval> style lista_prop lista_prop2 prop valpropriedade file
%token <text> B_WORD CSSSELECTOR LEX_PX LEX_EM LEX_PERCENT LEX_DEG LEX_CM LEX_MM
%token <intval> LEX_INT
%%

file: style;

style:	B_WORD {strcpy(out,$1); printf("%s\n", out);} '{' lista_prop2 '}'|	style B_WORD {strcpy(out,$2); printf("%s\n", out);} '{' lista_prop2 '}';

lista_prop: prop | lista_prop ';' prop;

lista_prop2 : lista_prop | lista_prop ';';

prop: B_WORD {strcpy(out,$1); printf("\t*%s = ", out);} ':' valpropriedade;

valpropriedade: B_WORD {strcpy(out,$1); printf("%s\n", out);} |
LEX_INT {printf("%d\n",$1);} |
LEX_PX {strcpy(out,$1); printf("\%s\n", out);} |
LEX_EM {strcpy(out,$1); printf("\%s\n", out);} |
LEX_PERCENT {strcpy(out,$1); printf("\%s\n", out);} |
LEX_DEG {strcpy(out,$1); printf("\%s\n", out);} |
LEX_CM {strcpy(out,$1); printf("\%s\n", out);} |
LEX_MM {strcpy(out,$1); printf("\%s\n", out);};
%%

int yylex();

int yyerror(char* s) {
	printf("%s\n", s);
}

