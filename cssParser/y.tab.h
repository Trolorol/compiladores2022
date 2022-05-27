#define B_WORD 257
#define CSSSELECTOR 258
#define LEX_PX 259
#define LEX_EM 260
#define LEX_PERCENT 261
#define LEX_DEG 262
#define LEX_CM 263
#define LEX_MM 264
#define LEX_INT 265
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
