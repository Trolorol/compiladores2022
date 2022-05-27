
%{
#include <stdio.h>
#include <stdlib.h>

extern FILE * yyout;
char auxi[50];
int contC=0;
int contL=0;

%}
%error-verbose
%start ficheiro

%union{
	char* text;
	int intval;
 }

%token <text> PALAVRA PROPRIEDADE_PX URL TABLE AFIM TD TR HREF ATEXTO IMG IMG_NOME SRC FORM INPUT HEAD BODY HTML
%token <intval> VALPROPRIEDADE PROPRIEDADE_INT
%type <intval> estilo lista_prop lista_prop2 prop valpropriedade ficheiro html table coluna linha url

 

%%

ficheiro: HTML HEAD {printf("HEAD\n");} html_2 AFIM BODY {printf("BODY\n");} html_2 AFIM AFIM
			|html_2
			| estilo
			;
			
html_2: /* vazio */
		 |html	
		 | html_2 html
		;
			
/*-------------------------------------------------------------HTML----------------------------------------------------------------*/

html:url
		|table
		|texto 
		|image
		|form
		;
		
form: '<' FORM '>' {printf("FORM\n");} form_conteudo AFIM
		;
		
form_conteudo: form_2
						| form_conteudo form_2
						;
						
form_2: '<' INPUT form_adicional2 '>'
			;
						
form_adicional2: form_adicional
						| form_adicional2 form_adicional
						;
						
form_adicional: /* vazio */
						| palavra '=' '"' valpropriedade '"'
						;

image: '<' IMG SRC '=' '"'{printf("IMAGEM URL = ");} PALAVRA {strcpy(auxi,$7); printf("%s ", auxi);} '"' image_conteudo '>' 
		;

image_conteudo:  /* vazio */
						| {printf("IMAGEM NOME = ");} IMG_NOME '=' '"' PALAVRA {strcpy(auxi,$5); printf("%s \n", auxi);} '"'
						| form_adicional2
						;
		
texto: ATEXTO form_adicional2 '>' {printf("TEXTO\n");} palavra  AFIM  {printf("\n");}
		;
		
palavra: palavra_conteudo
			| palavra palavra_conteudo
			;
		
palavra_conteudo:  PALAVRA {strcpy(auxi,$1); printf("%s ", auxi);}
							;
		
url: '<' PALAVRA HREF  '=' '"' URL {strcpy(auxi,$6); printf("URL = %s", auxi);} '"' form_adicional2 '>' url_texto AFIM
	;
	
url_texto: /* vazio */
			| {printf(" LINK TEXTO = ");} palavra {printf("\n");}
			;
		
		
table: '<' TABLE form_adicional2 '>' {contC=0;contL=0;} coluna AFIM {printf("numero linhas = %d\nnumero colunas = %d\n",contL/contC,contC);}
					;
		
coluna:  coluna_content
		| coluna coluna_content
		;
		
coluna_content: {contC++; printf("Coluna nº%d\n",contC);}'<' TR form_adicional2 '>' linha AFIM 
						;

linha: linha_conteudo
		| linha linha_conteudo;
		;
		
linha_conteudo: '<' TD form_adicional2 '>' conteudo AFIM {contL++;}
						;
		
conteudo: PALAVRA  {strcpy(auxi,$1); printf("%s\n", auxi);}
			| url 
			| image
			;
			
/*-------------------------------------------------------------CSS------------------------------------------------------------------*/
estilo:	PALAVRA {strcpy(auxi,$1); printf("%s\n", auxi);} '{' lista_prop2 '}' 
		|	estilo PALAVRA {strcpy(auxi,$2); printf("%s\n", auxi);} '{' lista_prop2 '}' 
		;
		

lista_prop: prop
				|	lista_prop ';' prop 
				;

lista_prop2 : lista_prop
					| lista_prop ';' 
					;
					
prop: PALAVRA {strcpy(auxi,$1); printf("\t*%s = ", auxi);} ':' valpropriedade 
		;
		
valpropriedade: PALAVRA {strcpy(auxi,$1); printf("%s\n", auxi);}
						| PROPRIEDADE_INT {printf("%d\n",$1);} 
						|PROPRIEDADE_PX {strcpy(auxi,$1); printf("\%s\n", auxi);} 
						;
		

%%



int yylex();

int yyerror(char* s) {
	printf("%s\n", s);
}

