%{
#include <stdio.h>
#include "lab3.tab.h"
%}

%option noyywrap

%%

[0-9]+ {yylval = atoi(yytext); return NUMBER;}

[^ \t\n] {  return yytext[0];}

\n { return yytext[0];}

. {}

%%
