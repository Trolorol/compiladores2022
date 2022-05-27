%token <text> HTML END_HTML HEAD END_HEAD BODY END_BODY TEXT A END_A IMG TABLE END_TABLE P END_P TR END_TR TH END_TH TD END_TD BR FORM END_FORM LABEL END_LABEL INPUT
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

%start tag

%union{
	char* text;
}

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
	
tag_p:			P END_P { printf("empty paragraph.\n"); }
			|	P TEXT { printf("\t%s\n", $2); } END_P { printf("parsed paragraph.\n"); }
			;
			
tag_br:			BR { printf("parsed line break.\n"); };
			
/*---------- LINK ----------*/
			
tag_href:		A seq_html_propty '>' END_A { printf("parsed link with no text.\n"); }
			|	A seq_html_propty '>' TEXT { printf("parsed link: %s.\n", $4); } END_A
			|	tag_href tag_href
			;
			
/*---------- IMAGE ----------*/

tag_img:		IMG seq_html_propty '>' { printf("parsed image.\n"); }
			|	tag_img tag_img
			;

/*---------- TABLE ----------*/

tag_table:		TABLE END_TABLE { printf("empty table.\n"); }
			|	TABLE seq_table_rows END_TABLE { printf("parsed table.\n"); }
			;
			
seq_table_rows:	tag_table_r
			|	seq_table_rows tag_table_r
			;
			
tag_table_r:	TR END_TR { printf("empty table row\n"); }
			|	TR seq_table_cell END_TR { printf("parsed table row\n"); }
			;
			
seq_table_cell:	tag_table_cell
			|	seq_table_cell tag_table_cell
			;

tag_table_cell:	TH END_TH { printf("\tempty table header\n"); }
			|	TH { printf("\theader cell:\n"); } table_cell_val END_TH 
			|	TD END_TD { printf("\tempty table data\n"); }
			|	TD { printf("\tdata cell:\n"); } table_cell_val END_TD	
			;
			
table_cell_val:	TEXT { printf("\t%s\n", $1); }
			|	tag_href
			|	tag_img
			;
			
/*---------- FORM ----------*/

tag_form:		FORM END_FORM { printf("empty form.\n"); }
			|	FORM seq_form_element END_FORM { printf("parsed form.\n"); }
			;
			
seq_form_element:	tag_form_element
			|		seq_form_element tag_form_element
			;
			
tag_form_element:	LABEL seq_html_propty '>' TEXT { printf("\ttext: %s\n", $4); } END_LABEL { printf("parsed form label\n"); }
			|		INPUT seq_html_propty '>' { printf("parsed form input\n"); }
			;

/*---------- HTML TAG PROPERTIES ----------*/

seq_html_propty:		html_propty
					|	seq_html_propty html_propty 
					;

html_propty:		TEXT { printf("\t%s = ", $1); } '=' '"' TEXT { printf("%s\n", $5);} '"'
			;

%%

