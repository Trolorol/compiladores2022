#define PALAVRA 257
#define AFIM 258
#define CSSSELECTOR 259
#define LEX_PX 260
#define LEX_EM 261
#define LEX_PERCENT 262
#define LEX_DEG 263
#define LEX_CM 264
#define LEX_MM 265
#define LEX_INT 266
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
extern YYSTYPE yylval;
