
%{
#include <stdio.h>
#include "lab4.tab.h"

%}

%option noyywrap

%%

([1-9][0-9]*)|0  { yylval.ival = atoi(yytext); return INTEGER; } 
(([1-9][0-9]*)|0)(\.[0-9]+)  { yylval.dval= atof(yytext); return DECIMAL; } 

[^ \t\n] { return yytext[0];}

\n { return yytext[0];}

. {}

%%