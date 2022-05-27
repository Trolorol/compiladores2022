main : lex.yy.o y.tab.o main.o
	gcc -o main lex.yy.o y.tab.o main.o

main.o : main.c
	gcc -c main.c

lex.yy.o : lex.yy.c
	gcc -c lex.yy.c

y.tab.o : y.tab.c
	gcc -c y.tab.c

lex.yy.c : lexCss.l y.tab.c
	flex lexCss.l

y.tab.c : yaccCss.y
	byacc -d yaccCss.y