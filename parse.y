%{
    #include "lex.yy.c"
    #include "genHtml.hpp"
    void yyerror(const char *str);
%}

%union {
    double realVal;
    TreeNode* node;
}

%token PLUS MINUS MULT DIV <realVal> NUMBER NEWLINE
%type <node> S
%type <node> E
%type <node> T
%type <node> F
%start S

%%

S: E NEWLINE{
    $$=$1;
    printf("Evaluation Result: %f\n", $$->val);
    generateOutputHtml($$);
    printf("Output File generated successfully\n");
    exit(0);
}
;

E: E PLUS T {$$=new TreeNode($1, $3, $1->val+$3->val, 1);}
| E MINUS T {$$=new TreeNode($1, $3, $1->val-$3->val, 2);}
| T {$$=$1;}
;

T : T MULT F {$$=new TreeNode($1, $3, $1->val*$3->val, 3);}
| T DIV F {if($3->val==0.0)  yyerror("Exception: divide by zero"); $$=new TreeNode($1, $3, $1->val/$3->val, 4);}
| F {$$=$1;}
;

F: NUMBER {$<node>$ = new TreeNode($1);}

%%

int main(){
    int token;
    // yyin = fopen("input.txt", "r");
    int isInValid = yyparse();
    if(isInValid)
        printf("The arithmetic expression is invalid.\n Make sure it contains '+', '-', '*' and '/' only..");
    return 0;
}

void yyerror(const char *str) 
{ 
	printf("%s", str);
    exit(1);
} 