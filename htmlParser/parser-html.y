%{
int yylex(void);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern FILE * yyout;
 int yyerror(char* s) {
   printf("%s\n", s);
 }
 char chars[50];
%}

%start tag

%union{
	char* text;
}
%token <text> TEXT A END_A IMG TABLE END_TABLE P END_P TR END_TR TH END_TH TD END_TD BR FORM END_FORM LABEL END_LABEL INPUT END_INPUT


%%

/*---------- START ----------*/

tag:			tag_html
			|	tag tag_html
			;

tag_html:		tag_p
			|	tag_br
			|	tag_href
			|	tag_img
			|	tag_table
			|	tag_form
			;

/*---------- TEXT ----------*/
	
tag_p:			P END_P { printf("empty p\n"); }
			|	P TEXT { printf("\t%s\n", $2); } END_P 
			;
			
tag_br:			BR { printf("br\n"); };
			
/*---------- LINK ----------*/
			
tag_href:		A seq_html_propty '>' END_A { printf("link\n"); }
			|	tag_href tag_href
			;
			
/*---------- IMAGE ----------*/

tag_img:		IMG seq_html_propty '>' { printf("img\n"); }
			|	tag_img tag_img
			;

/*---------- TABLE ----------*/

tag_table:		TABLE END_TABLE { printf("empty table\n"); }
			|	TABLE seq_table_rows END_TABLE
			;
			
seq_table_rows:	tag_table_r
			|	seq_table_rows tag_table_r
			;
			
tag_table_r:	TR END_TR { printf("empty tr\n"); }
			|	TR seq_table_element END_TR
			;
			
seq_table_element:	tag_table_element
			|		seq_table_element tag_table_element
			;

tag_table_element: 	TH END_TH { printf("empty th\n"); }
			|		TH TEXT { printf("\t%s\n", $2); }  END_TH 
			|		TD END_TD { printf("empty td\n"); }
			|		TD TEXT { printf("\t%s\n", $2); }  END_TD
			;
			
/*---------- FORM ----------*/

tag_form:		FORM END_FORM { printf("empty form\n"); }
			|	FORM seq_form_element END_FORM
			;
			
seq_form_element:	tag_form_element
			|		seq_form_element tag_form_element
			;
			
tag_form_element:	LABEL seq_html_propty '>' TEXT { printf("\t%s\n", $4); } END_LABEL
			|		INPUT seq_html_propty '>' TEXT { printf("\t%s\n", $4); } END_INPUT
			;

/*---------- HTML PROPERTIES ----------*/

seq_html_propty:		html_propty
					|	seq_html_propty html_propty 
					;

html_propty:		TEXT { printf("prop\t%s = ", $1); } '=' '"' 
						TEXT { printf("prop_val%s\n", $5);} '"'
			;

%%

