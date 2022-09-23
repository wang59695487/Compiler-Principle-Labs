%{
#include <stdio.h>
#include <ctype.h>
#include <math.h>
%}

%{
#define YYLTYPE int
#define YYSTYPE int
%}


%token NUMBER
%left '(' ')'
%left '+' '-'
%left '*' '/'
%right '^' UMINUS


%%

command : line{};
line: line '\n' exp { printf("= %d\n", $3); }
| exp { printf("= %d\n", $1); };




exp : NUMBER {$$ == $1;}
|exp '+' exp {$$ = $1 + $3 ;}
|exp '-' exp {$$ = $1 - $3 ;}
|exp '*' exp {$$ = $1 * $3 ;}
|exp '/' exp {$$ = $1 / $3 ;}
|exp '^' exp {$$ = pow($1 , $3);}
|'-' exp %prec UMINUS {$$ = -$2 ;}
|'(' exp ')' {$$ = $2 ;}
;
%%

int main() {
    yyparse();
}


int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}
