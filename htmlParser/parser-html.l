%option noyywrap
%{
#include "y.tab.h"
#include <stdlib.h>
%}


%%

\<p\>					return P;
\<\/p\>					return END_P;

\<br\>					return BR;

\<a						return A;
\<\/a\>					return END_A;

\<img					return IMG;

\<table\>				return TABLE;
\<\/table\>				return END_TABLE;
\<tr\>					return TR;
\<\/tr\>				return END_TR;
\<th\>					return TH;
\<\/th\>				return END_TH;
\<td\>					return TD;
\<\/td\>				return END_TD;

\<form\>				return FORM;
\<\/form\>				return END_FORM;
\<label					return LABEL;
\<\/label\>				return END_LABEL;
\<input					return INPUT;
\<\/input\>				return END_INPUT;

[="/>]					return yytext[0];

[a-zA-Z0-9\/:.()_ ]+	{ yylval.text = yytext; return TEXT; }

%%

