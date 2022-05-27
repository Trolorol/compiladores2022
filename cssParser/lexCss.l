%option	noyywrap
%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[.#]{1}[._a-zA-Z-]+[\{] {yylval.text = yytext; return CSSSELECTOR;}
[.#]?[._a-zA-Z-]+	{yylval.text = yytext; return B_WORD;}
[0-9]+			{yylval.intval = atoi(yytext); return LEX_INT;}
[0-9]+px		{yylval.text = yytext; return LEX_PX;}
[0-9]+em		{yylval.text = yytext; return LEX_EM;}
[0-9]+%		    {yylval.text = yytext; return LEX_PERCENT;}
[0-9]+deg		{yylval.text = yytext; return LEX_DEG;}
[0-9]+cm		{yylval.text = yytext; return LEX_CM;}
[0-9]+mm		{yylval.text = yytext; return LEX_MM;}

[{}:;<>="]			return yytext[0];

%%

