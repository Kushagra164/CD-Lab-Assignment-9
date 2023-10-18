%{
    #include "TreeNode.hpp"
    #include "parse.tab.h"
    #define ERROR -1
%}
digit [0-9]

%%
\+ return PLUS;
- return MINUS;
\* return MULT;
\/ return DIV;
{digit}{digit}*(\.{digit}{digit}*)? {
    yylval.realVal = (double)atof(yytext);
    return NUMBER;
}
\n return NEWLINE;
. return ERROR;
%%
int yywrap(void) {return 1;}