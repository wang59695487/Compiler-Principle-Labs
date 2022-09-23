%{
#include <stdio.h>
#include <ctype.h>
#include <math.h>

%}

%union
{
    int ival;
    double dval;
}

%token <ival> INTEGER
%token <dval> DECIMAL
%type <ival> iexpression
%type <dval> dexpression

%left '(' ')'
%left '+' '-'
%left '*' '/'
%right '^' UMINUS

%%

command : line{};
line: line '\n' iexpression {
    printf("= %d\n", $3);
}
|iexpression{
    printf("= %d\n", $1);
}
| line '\n' dexpression{
    printf("= %f\n", $3);
}
|dexpression{
    printf("= %f\n", $1);
}
;


iexpression : INTEGER   { $$ = $1; }
|iexpression '*' iexpression   { $$ = $1 * $3; }
|iexpression '/' iexpression   { $$ = $1 / $3; }
|iexpression '+' iexpression   { $$ = $1 + $3; }
|iexpression '-' iexpression   { $$ = $1 - $3; }
|'-' iexpression  %prec UMINUS  {$$ = -$2; }
|'(' iexpression ')' { $$ = $2;}
|iexpression '^' iexpression {$$=pow($1,$3);}
;

dexpression : DECIMAL    { $$ = $1; }
|   dexpression '+' iexpression   { $$ = $1 + $3; }
|   dexpression '-' iexpression   { $$ = $1 - $3; }
|   dexpression '*' iexpression  { $$ = $1 * $3; }
|   dexpression '/' iexpression  { $$ = $1 / $3; }
|   iexpression '+' dexpression  { $$ = $1 + $3; }
|   iexpression '-' dexpression   { $$ = $1 - $3; }
|   iexpression '*'  dexpression { $$ = $1 * $3; }
|   iexpression '/'  dexpression  { $$ = $1 / $3; }
|   dexpression '+' dexpression   { $$ = $1 + $3; }
|   dexpression '-'  dexpression   { $$ = $1 - $3; }
|   dexpression '*'  dexpression   { $$ = $1 * $3; }
|   dexpression '/'  dexpression   { $$ = $1 / $3; }
|   dexpression '^' dexpression {$$=pow($1,$3);}
|   dexpression '^' iexpression {$$=pow($1,$3);}
|   iexpression '^' dexpression {$$=pow($1,$3);}
|   '-' dexpression  %prec UMINUS     { $$ = -$2;}
|   '(' dexpression ')'          {$$=$2;}
;


%%

int main() {
    yyparse();
}


int yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}
