parse: y.tab.c lex.yy.c
	gcc -o parse y.tab.c

y.tab.c: CS315f22_team7.y lex.yy.c
	yacc CS315f22_team7.y

lex.yy.c: CS315f22_team7.l
	lex CS315f22_team7.l

clean:
	rm -f lex.yy.c y.tab.c parse
