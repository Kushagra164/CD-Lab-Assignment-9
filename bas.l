%{
    #include "y.tab.h"
%}

%option yylineno

digit [0-9]
int {digit}+
%%

"(" {return LPAREN;}
")" {return RPAREN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MULT;}
"/" {return DIV;}
"%" {return MOD;}
"!" {return NOT;}
"&" {return AND;}
"|" {return OR;}
"^" {return XOR;}
{int} {
    yylval.int_val = atoi(yytext);
    return NUM;
}
"\n" {return TERM;}

%%

int yywrap() {
    return 1;
}