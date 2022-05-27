%token <text> HTML END_HTML HEAD END_HEAD TITLE END_TITLE BODY END_BODY TEXT A END_A IMG TABLE END_TABLE P END_P TR END_TR TH END_TH TD END_TD BR FORM END_FORM LABEL END_LABEL INPUT
%{
int yylex(void);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern FILE * yyout;
 int yyerror(char* s) {
   printf("%s\n", s);
 }
%}

%start html

%union{
	char* text;
}

%%

/*---------- START ----------*/
			
html:			HTML TEXT END_HTML { printf("empty html document.\n"); }
			|	HTML head END_HTML { printf("html with no body.\n"); }
			|	HTML body END_HTML { printf("html with no head.\n"); }
			|	HTML head body END_HTML { printf("END html document.\n"); }
			;
			
head:			HEAD END_HEAD { printf("empty head.\n"); }
			|	HEAD seq_head_tag END_HEAD { printf("--- parsed head.\n"); }
			;

seq_head_tag:	head_tag
			|	seq_head_tag head_tag
			;

head_tag:		TITLE TEXT { printf("\t%s\n", $2); } END_TITLE { printf("parsed title.\n"); }
			;

body:			BODY END_BODY { printf("empty body.\n"); }
			|	BODY seq_body_tag END_BODY { printf("--- parsed body.\n"); }
			;

seq_body_tag:	body_tag
			|	seq_body_tag body_tag
			;

body_tag:		p
			|	br
			|	a
			|	img
			|	table
			|	form
			;

/*---------- TEXT ----------*/
	
p:				P END_P { printf("empty paragraph.\n"); }
			|	P TEXT { printf("\t%s\n", $2); } END_P { printf("parsed paragraph.\n"); }
				;
			
br:				BR { printf("parsed line break.\n"); };
			
/*---------- LINK ----------*/
			
a:				A seq_html_tag_propty '>' END_A { printf("parsed link with no text.\n"); }
			|	A seq_html_tag_propty '>' TEXT { printf("parsed link: %s.\n", $4); } END_A
			|	a a
			;
			
/*---------- IMAGE ----------*/

img:			IMG seq_html_tag_propty '>' { printf("parsed image.\n"); }
			|	img img
			;

/*---------- TABLE ----------*/

table:			TABLE END_TABLE { printf("empty table.\n"); }
			|	TABLE seq_table_rows END_TABLE { printf("parsed table.\n"); }
			;
			
seq_table_rows:	table_r
			|	seq_table_rows table_r
			;
			
table_r:		TR END_TR { printf("empty table row\n"); }
			|	TR seq_table_cell END_TR { printf("parsed table row\n"); }
			;
			
seq_table_cell:	table_cell
			|	seq_table_cell table_cell
			;

table_cell:		TH END_TH { printf("\tempty table header\n"); }
			|	TH { printf("\theader cell:\n"); } table_cell_val END_TH 
			|	TD END_TD { printf("\tempty table data\n"); }
			|	TD { printf("\tdata cell:\n"); } table_cell_val END_TD	
			;
			
table_cell_val:	TEXT { printf("\t%s\n", $1); }
			|	a
			|	img
			;
			
/*---------- FORM ----------*/

form:			FORM END_FORM { printf("empty form.\n"); }
			|	FORM seq_form_element END_FORM { printf("parsed form.\n"); }
			;
			
seq_form_element:	form_element
			|		seq_form_element form_element
			;
			
form_element:	LABEL seq_html_tag_propty '>' TEXT { printf("\ttext: %s\n", $4); } END_LABEL { printf("parsed form label\n"); }
			|	INPUT seq_html_tag_propty '>' { printf("parsed form input\n"); }
			;

/*---------- HTML TAG PROPERTIES ----------*/

seq_html_tag_propty:	html_tag_propty
					|	seq_html_tag_propty html_tag_propty 
					;

html_tag_propty:	TEXT { printf("\t%s = ", $1); } '=' '"' TEXT { printf("%s\n", $5);} '"';

%%

