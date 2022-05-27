parser-html.exe : lex.yy.o y.tab.o p-html.o
	gcc -o parser-html lex.yy.o y.tab.o p-html.o

p-html.o : p-html.c
	gcc -c p-html.c

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.c : parser-html.l y.tab.c
	flex parser-html.l

y.tab.c : parser-html.y
	yacc -d parser-html.y
