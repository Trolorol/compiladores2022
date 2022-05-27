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
