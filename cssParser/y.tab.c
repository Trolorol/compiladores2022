/* original parser id follows */
/* yysccsid[] = "@(#)yaccpar	1.9 (Berkeley) 02/21/93" */
/* (use YYMAJOR/YYMINOR for ifdefs dependent on parser version) */

#define YYBYACC 1
#define YYMAJOR 1
#define YYMINOR 9
#define YYPATCH 20140715

#define YYEMPTY        (-1)
#define yyclearin      (yychar = YYEMPTY)
#define yyerrok        (yyerrflag = 0)
#define YYRECOVERING() (yyerrflag != 0)
#define YYENOMEM       (-2)
#define YYEOF          0
#define YYPREFIX "yy"

#define YYPURE 0

#line 2 "yaccCss.y"
#include <stdio.h>
#include <stdlib.h>

extern FILE * yyout;
char out[50];

#line 13 "yaccCss.y"
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union{
	char* text;
	int intval;
 } YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
#line 40 "y.tab.c"

/* compatibility with bison */
#ifdef YYPARSE_PARAM
/* compatibility with FreeBSD */
# ifdef YYPARSE_PARAM_TYPE
#  define YYPARSE_DECL() yyparse(YYPARSE_PARAM_TYPE YYPARSE_PARAM)
# else
#  define YYPARSE_DECL() yyparse(void *YYPARSE_PARAM)
# endif
#else
# define YYPARSE_DECL() yyparse(void)
#endif

/* Parameters sent to lex. */
#ifdef YYLEX_PARAM
# define YYLEX_DECL() yylex(void *YYLEX_PARAM)
# define YYLEX yylex(YYLEX_PARAM)
#else
# define YYLEX_DECL() yylex(void)
# define YYLEX yylex()
#endif

/* Parameters sent to yyerror. */
#ifndef YYERROR_DECL
#define YYERROR_DECL() yyerror(const char *s)
#endif
#ifndef YYERROR_CALL
#define YYERROR_CALL(msg) yyerror(msg)
#endif

extern int YYPARSE_DECL();

#define B_WORD 257
#define CSSSELECTOR 258
#define COLOR 259
#define ALIGN_ITEMS 260
#define ALIGN_CONTENT 261
#define MARGIN 262
#define WIDTH 263
#define DISPLAY 264
#define LEX_AUTO 265
#define LEX_PX 266
#define LEX_EM 267
#define LEX_PERCENT 268
#define GRID 269
#define FLEX 270
#define B_HEXCOLOR 271
#define LEX_INT 272
#define YYERRCODE 256
typedef short YYINT;
static const YYINT yylhs[] = {                           -1,
    0,    2,    1,    4,    1,    5,    5,    3,    3,    7,
    6,    8,    8,    8,
};
static const YYINT yylen[] = {                            2,
    1,    0,    5,    0,    6,    1,    3,    1,    2,    0,
    4,    1,    1,    1,
};
static const YYINT yydefred[] = {                         0,
    2,    0,    0,    0,    4,    0,    0,   10,    0,    0,
    6,    0,    0,    3,    0,    0,    0,    7,    5,   12,
   14,   13,   11,
};
static const YYINT yydgoto[] = {                          2,
    3,    4,    9,    7,   10,   11,   13,   23,
};
static const YYINT yysindex[] = {                      -256,
    0,    0, -255, -120,    0, -253, -118,    0, -119,  -52,
    0, -253,  -50,    0, -253, -115, -257,    0,    0,    0,
    0,    0,    0,
};
static const YYINT yyrindex[] = {                         0,
    0,    0,   11,    0,    0,    0,    0,    0,    0, -113,
    0,    0,    0,    0, -112,    0,    0,    0,    0,    0,
    0,    0,    0,
};
static const YYINT yygindex[] = {                         0,
    0,    0,    2,    0,    0,    1,    0,    0,
};
#define YYTABLESIZE 16
static const YYINT yytable[] = {                         20,
    1,    5,    6,    8,   12,   14,   15,   17,   21,   19,
    1,    8,    9,   16,   22,   18,
};
static const YYINT yycheck[] = {                        257,
  257,  257,  123,  257,  123,  125,   59,   58,  266,  125,
    0,  125,  125,   12,  272,   15,
};
#define YYFINAL 2
#ifndef YYDEBUG
#define YYDEBUG 0
#endif
#define YYMAXTOKEN 272
#define YYUNDFTOKEN 283
#define YYTRANSLATE(a) ((a) > YYMAXTOKEN ? YYUNDFTOKEN : (a))
#if YYDEBUG
static const char *const yyname[] = {

"end-of-file",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"':'","';'",0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,"'{'",0,"'}'",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"B_WORD",
"CSSSELECTOR","COLOR","ALIGN_ITEMS","ALIGN_CONTENT","MARGIN","WIDTH","DISPLAY",
"LEX_AUTO","LEX_PX","LEX_EM","LEX_PERCENT","GRID","FLEX","B_HEXCOLOR","LEX_INT",
0,0,0,0,0,0,0,0,0,0,"illegal-symbol",
};
static const char *const yyrule[] = {
"$accept : ficheiro",
"ficheiro : style",
"$$1 :",
"style : B_WORD $$1 '{' lista_prop2 '}'",
"$$2 :",
"style : style B_WORD $$2 '{' lista_prop2 '}'",
"lista_prop : prop",
"lista_prop : lista_prop ';' prop",
"lista_prop2 : lista_prop",
"lista_prop2 : lista_prop ';'",
"$$3 :",
"prop : B_WORD $$3 ':' valpropriedade",
"valpropriedade : B_WORD",
"valpropriedade : LEX_INT",
"valpropriedade : LEX_PX",

};
#endif

int      yydebug;
int      yynerrs;

int      yyerrflag;
int      yychar;
YYSTYPE  yyval;
YYSTYPE  yylval;

/* define the initial stack-sizes */
#ifdef YYSTACKSIZE
#undef YYMAXDEPTH
#define YYMAXDEPTH  YYSTACKSIZE
#else
#ifdef YYMAXDEPTH
#define YYSTACKSIZE YYMAXDEPTH
#else
#define YYSTACKSIZE 10000
#define YYMAXDEPTH  10000
#endif
#endif

#define YYINITSTACKSIZE 200

typedef struct {
    unsigned stacksize;
    YYINT    *s_base;
    YYINT    *s_mark;
    YYINT    *s_last;
    YYSTYPE  *l_base;
    YYSTYPE  *l_mark;
} YYSTACKDATA;
/* variables for the parser stack */
static YYSTACKDATA yystack;
#line 49 "yaccCss.y"

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
#line 238 "y.tab.c"

#if YYDEBUG
#include <stdio.h>		/* needed for printf */
#endif

#include <stdlib.h>	/* needed for malloc, etc */
#include <string.h>	/* needed for memset */

/* allocate initial stack or double stack size, up to YYMAXDEPTH */
static int yygrowstack(YYSTACKDATA *data)
{
    int i;
    unsigned newsize;
    YYINT *newss;
    YYSTYPE *newvs;

    if ((newsize = data->stacksize) == 0)
        newsize = YYINITSTACKSIZE;
    else if (newsize >= YYMAXDEPTH)
        return YYENOMEM;
    else if ((newsize *= 2) > YYMAXDEPTH)
        newsize = YYMAXDEPTH;

    i = (int) (data->s_mark - data->s_base);
    newss = (YYINT *)realloc(data->s_base, newsize * sizeof(*newss));
    if (newss == 0)
        return YYENOMEM;

    data->s_base = newss;
    data->s_mark = newss + i;

    newvs = (YYSTYPE *)realloc(data->l_base, newsize * sizeof(*newvs));
    if (newvs == 0)
        return YYENOMEM;

    data->l_base = newvs;
    data->l_mark = newvs + i;

    data->stacksize = newsize;
    data->s_last = data->s_base + newsize - 1;
    return 0;
}

#if YYPURE || defined(YY_NO_LEAKS)
static void yyfreestack(YYSTACKDATA *data)
{
    free(data->s_base);
    free(data->l_base);
    memset(data, 0, sizeof(*data));
}
#else
#define yyfreestack(data) /* nothing */
#endif

#define YYABORT  goto yyabort
#define YYREJECT goto yyabort
#define YYACCEPT goto yyaccept
#define YYERROR  goto yyerrlab

int
YYPARSE_DECL()
{
    int yym, yyn, yystate;
#if YYDEBUG
    const char *yys;

    if ((yys = getenv("YYDEBUG")) != 0)
    {
        yyn = *yys;
        if (yyn >= '0' && yyn <= '9')
            yydebug = yyn - '0';
    }
#endif

    yynerrs = 0;
    yyerrflag = 0;
    yychar = YYEMPTY;
    yystate = 0;

#if YYPURE
    memset(&yystack, 0, sizeof(yystack));
#endif

    if (yystack.s_base == NULL && yygrowstack(&yystack) == YYENOMEM) goto yyoverflow;
    yystack.s_mark = yystack.s_base;
    yystack.l_mark = yystack.l_base;
    yystate = 0;
    *yystack.s_mark = 0;

yyloop:
    if ((yyn = yydefred[yystate]) != 0) goto yyreduce;
    if (yychar < 0)
    {
        if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, reading %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
    }
    if ((yyn = yysindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: state %d, shifting to state %d\n",
                    YYPREFIX, yystate, yytable[yyn]);
#endif
        if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
        {
            goto yyoverflow;
        }
        yystate = yytable[yyn];
        *++yystack.s_mark = yytable[yyn];
        *++yystack.l_mark = yylval;
        yychar = YYEMPTY;
        if (yyerrflag > 0)  --yyerrflag;
        goto yyloop;
    }
    if ((yyn = yyrindex[yystate]) && (yyn += yychar) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yychar)
    {
        yyn = yytable[yyn];
        goto yyreduce;
    }
    if (yyerrflag) goto yyinrecovery;

    YYERROR_CALL("syntax error");

    goto yyerrlab;

yyerrlab:
    ++yynerrs;

yyinrecovery:
    if (yyerrflag < 3)
    {
        yyerrflag = 3;
        for (;;)
        {
            if ((yyn = yysindex[*yystack.s_mark]) && (yyn += YYERRCODE) >= 0 &&
                    yyn <= YYTABLESIZE && yycheck[yyn] == YYERRCODE)
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: state %d, error recovery shifting\
 to state %d\n", YYPREFIX, *yystack.s_mark, yytable[yyn]);
#endif
                if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
                {
                    goto yyoverflow;
                }
                yystate = yytable[yyn];
                *++yystack.s_mark = yytable[yyn];
                *++yystack.l_mark = yylval;
                goto yyloop;
            }
            else
            {
#if YYDEBUG
                if (yydebug)
                    printf("%sdebug: error recovery discarding state %d\n",
                            YYPREFIX, *yystack.s_mark);
#endif
                if (yystack.s_mark <= yystack.s_base) goto yyabort;
                --yystack.s_mark;
                --yystack.l_mark;
            }
        }
    }
    else
    {
        if (yychar == YYEOF) goto yyabort;
#if YYDEBUG
        if (yydebug)
        {
            yys = yyname[YYTRANSLATE(yychar)];
            printf("%sdebug: state %d, error recovery discards token %d (%s)\n",
                    YYPREFIX, yystate, yychar, yys);
        }
#endif
        yychar = YYEMPTY;
        goto yyloop;
    }

yyreduce:
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: state %d, reducing by rule %d (%s)\n",
                YYPREFIX, yystate, yyn, yyrule[yyn]);
#endif
    yym = yylen[yyn];
    if (yym)
        yyval = yystack.l_mark[1-yym];
    else
        memset(&yyval, 0, sizeof yyval);
    switch (yyn)
    {
case 2:
#line 26 "yaccCss.y"
	{strcpy(out,yystack.l_mark[0].text); printf("%s\n", out);}
break;
case 4:
#line 27 "yaccCss.y"
	{strcpy(out,yystack.l_mark[0].text); printf("%s\n", out);}
break;
case 10:
#line 39 "yaccCss.y"
	{strcpy(out,yystack.l_mark[0].text); printf("\t*%s = ", out);}
break;
case 12:
#line 42 "yaccCss.y"
	{strcpy(out,yystack.l_mark[0].text); printf("%s\n", out);}
break;
case 13:
#line 43 "yaccCss.y"
	{printf("%d\n",yystack.l_mark[0].intval);}
break;
case 14:
#line 44 "yaccCss.y"
	{strcpy(out,yystack.l_mark[0].text); printf("\%s\n", out);}
break;
#line 464 "y.tab.c"
    }
    yystack.s_mark -= yym;
    yystate = *yystack.s_mark;
    yystack.l_mark -= yym;
    yym = yylhs[yyn];
    if (yystate == 0 && yym == 0)
    {
#if YYDEBUG
        if (yydebug)
            printf("%sdebug: after reduction, shifting from state 0 to\
 state %d\n", YYPREFIX, YYFINAL);
#endif
        yystate = YYFINAL;
        *++yystack.s_mark = YYFINAL;
        *++yystack.l_mark = yyval;
        if (yychar < 0)
        {
            if ((yychar = YYLEX) < 0) yychar = YYEOF;
#if YYDEBUG
            if (yydebug)
            {
                yys = yyname[YYTRANSLATE(yychar)];
                printf("%sdebug: state %d, reading %d (%s)\n",
                        YYPREFIX, YYFINAL, yychar, yys);
            }
#endif
        }
        if (yychar == YYEOF) goto yyaccept;
        goto yyloop;
    }
    if ((yyn = yygindex[yym]) && (yyn += yystate) >= 0 &&
            yyn <= YYTABLESIZE && yycheck[yyn] == yystate)
        yystate = yytable[yyn];
    else
        yystate = yydgoto[yym];
#if YYDEBUG
    if (yydebug)
        printf("%sdebug: after reduction, shifting from state %d \
to state %d\n", YYPREFIX, *yystack.s_mark, yystate);
#endif
    if (yystack.s_mark >= yystack.s_last && yygrowstack(&yystack) == YYENOMEM)
    {
        goto yyoverflow;
    }
    *++yystack.s_mark = (YYINT) yystate;
    *++yystack.l_mark = yyval;
    goto yyloop;

yyoverflow:
    YYERROR_CALL("yacc stack overflow");

yyabort:
    yyfreestack(&yystack);
    return (1);

yyaccept:
    yyfreestack(&yystack);
    return (0);
}
