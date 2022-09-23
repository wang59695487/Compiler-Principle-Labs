
%{
#include <stdio.h>

int char_count = 0, word_count = 0, line_count = 1;

int state = 0; // 0: words acceptable  1: reading a word  2: error when finding a symbol in a word
%}

%option noyywrap

%%

\n {
    if(state == 1)
        word_count++;
    state = 0; // reset the state
    char_count++;
    line_count++;
}

[" "\n\t] {
    if(state == 1)
        word_count++;  
    state = 0;    
    char_count++;
}

[A-Za-z0-9]+ {
    if(state == 0)
        state = 1;   
    char_count += yyleng;
}

. { 
    char_count++; 
}

%%

int main() {
    yylex();
    if(state == 1)
        word_count++;  // 1: read in a word
    printf("character_count: %d\n", char_count);
    printf("words_count: %d\n", word_count);
    printf("lines_count: %d\n", line_count);
    return 0;
}
