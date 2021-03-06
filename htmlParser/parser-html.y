%token <text> HTML END_HTML HEAD END_HEAD TITLE END_TITLE LINK BODY END_BODY TEXT A END_A IMG TABLE END_TABLE H1 END_H1 P END_P TR END_TR TH END_TH TD END_TD BR FORM END_FORM LABEL END_LABEL INPUT
%{
int yylex(void);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern FILE * yyout;
extern int elem_type;
 int yyerror(char* s) {
   printf("%s\n", s);
 }
 int row_ctr = 0;
 int col_ctr = 0;
 int max_col_ctr = 0;
%}

%start html

%union{
	char* text;
}

%%

/*---------- START ----------*/
			
html:			HTML END_HTML { printf("empty html document.\n"); }
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

head_tag:		TITLE TEXT { if (elem_type == 1) printf("\t%s\n", $2); } END_TITLE { if (elem_type == 1) printf("parsed title.\n"); }
			|	LINK seq_link_tag_propty '>' { if (elem_type == 2) printf("parsed head link.\n"); }
			;

body:			BODY END_BODY { printf("empty body.\n"); }
			|	BODY seq_body_tag END_BODY { printf("--- parsed body.\n"); }
			;

seq_body_tag:	body_tag
			|	seq_body_tag body_tag
			;

body_tag:		h1
			|	p
			|	br
			|	a
			|	img
			|	table
			|	form
			;

/*---------- 1.TEXT ----------*/
	
h1:				H1 END_H1 { if (elem_type == 1) printf("empty header.\n"); }
			|	H1 TEXT { if (elem_type == 1) printf("\t%s\n", $2); } END_H1 { if (elem_type == 1) printf("parsed header.\n"); }
			;

p:				P END_P { if (elem_type == 1) printf("empty paragraph.\n"); }
			|	P TEXT { if (elem_type == 1) printf("\t%s\n", $2); } END_P { if (elem_type == 1) printf("parsed paragraph.\n"); }
			;
			
br:				BR;
			
/*---------- 2.LINK ----------*/
			
a:				A seq_link_tag_propty '>' END_A { if (elem_type == 2) printf("parsed link with no text.\n"); }
			|	A seq_link_tag_propty '>' TEXT { if (elem_type == 2) printf("parsed link: %s.\n", $4); } END_A
			|	a a
			;
			
seq_link_tag_propty:	link_tag_propty
			|			seq_link_tag_propty link_tag_propty 
			;

link_tag_propty:		TEXT { if (elem_type == 2) printf("\t%s: ", $1); } '=' '"' TEXT { if (elem_type == 2) printf("%s\n", $5);} '"';
			
/*---------- 3.IMAGE ----------*/

img:					IMG seq_img_tag_propty '>' { if (elem_type == 3) printf("parsed image.\n"); }
			|			img img
			;

seq_img_tag_propty:		img_tag_propty
			|			seq_img_tag_propty img_tag_propty 
			;

img_tag_propty:			TEXT { if (elem_type == 3) printf("\t%s: ", $1); } '=' '"' TEXT { if (elem_type == 3) printf("%s\n", $5);} '"';

/*---------- 4.TABLE ----------*/

table:			TABLE END_TABLE { if (elem_type == 4) printf("empty table.\n"); }
			|	TABLE { row_ctr = 0; col_ctr = 0; max_col_ctr = 0; } seq_table_rows END_TABLE { if (elem_type == 4) printf("parsed table. %d rows, %d columns\n", row_ctr, max_col_ctr); }
			;
			
seq_table_rows:	table_r
			|	seq_table_rows table_r
			;
			
table_r:		TR END_TR { row_ctr++; col_ctr = 0; if (elem_type == 4) printf("row %d (empty)\n", row_ctr); }
			|	TR seq_table_cell END_TR { row_ctr++; col_ctr = 0; if (elem_type == 4) printf("row %d\n", row_ctr); }
			;
			
seq_table_cell:	table_cell
			|	seq_table_cell table_cell
			;

table_cell:		TH END_TH { col_ctr++; if(col_ctr > max_col_ctr) max_col_ctr = col_ctr; if (elem_type == 4) printf("\tempty table header\n"); }
			|	TH { col_ctr++; if(col_ctr > max_col_ctr) max_col_ctr = col_ctr; if (elem_type == 4) printf("\theader cell:\n"); } table_cell_val END_TH 
			|	TD END_TD { col_ctr++; if(col_ctr > max_col_ctr) max_col_ctr = col_ctr; if (elem_type == 4) printf("\tempty table data\n"); }
			|	TD { col_ctr++; if(col_ctr > max_col_ctr) max_col_ctr = col_ctr; if (elem_type == 4) printf("\tdata cell:\n"); } table_cell_val END_TD	
			;
			
table_cell_val:	TEXT { if (elem_type == 4) printf("\t%s\n", $1); }
			|	a
			|	img
			;
			
/*---------- 5.FORM ----------*/

form:			FORM END_FORM { if (elem_type == 5) printf("empty form.\n"); }
			|	FORM seq_form_element END_FORM { if (elem_type == 5) printf("parsed form.\n"); }
			;
			
seq_form_element:	form_element
			|		seq_form_element form_element
			;
			
form_element:	LABEL seq_form_tag_propty '>' TEXT { if (elem_type == 5) printf("\ttext: %s\n", $4); } END_LABEL { if (elem_type == 5) printf("parsed form label\n"); }
			|	INPUT seq_form_tag_propty '>' { if (elem_type == 5) printf("parsed form input\n"); }
			;
			
seq_form_tag_propty:	form_tag_propty
			|			seq_form_tag_propty form_tag_propty 
			;

form_tag_propty:		TEXT { if (elem_type == 5) printf("\t%s: ", $1); } '=' '"' TEXT { if (elem_type == 5) printf("%s\n", $5);} '"';

%%

