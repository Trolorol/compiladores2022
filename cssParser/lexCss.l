%option	noyywrap
%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
color			    return COLOR;
align-items			return ALIGN_ITEMS;
align-content		return ALIGN_CONTENT;
margin		        return MARGIN;
width               return WIDTH;
display             return DISPLAY;
auto                return LEX_AUTO;
grid                return GRID;
flex                return FLEX;



[.#]?[._a-zA-Z(-)?]+	{yylval.text = yytext; return B_WORD;}
#[0-9]+             {yylval.text = yytext; return B_HEXCOLOR;}
[0-9]+			{yylval.intval = atoi(yytext); return LEX_INT;}
[0-9]+px		{yylval.text = yytext; return LEX_PX;}
[0-9]+em		{yylval.text = yytext; return LEX_EM;}
[0-9]+%		    {yylval.text = yytext; return LEX_PERCENT;}

[{}:;<>="]			return yytext[0];

%%

// ([^\r\n,{}]+)(,(?=[^}]*{)|\s*{) {yylval.text = yytext; return CSSSELECTOR;}
