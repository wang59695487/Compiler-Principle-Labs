%{
#include <ctype.h>
#include <stdio.h>
#include <string.h>

size_t state = 0;     // 0:reserved words acceptable  1: reading a reserved word  2: exit 
char buffer[10];  //  save the reserved words

%}


%option noyywrap

%%

int|long|short|float|double|char|unsigned|signed|const|void|volatile|enum|struct|union|if|else|goto|switch|case|do|while|for|continue|break|return|default|typedef|auto|register|extern|static|sizeof {
    if( state == 0 ){
        strcpy(buffer,yytext);
        state = 1;
    }else{
        if(state == 1)
            printf("%s", buffer); 
        state = 2;
        printf("%s", yytext);
    }
}


[" "\n\t;()]|"{".*"}" {
    if(state == 1){
        for (int i = 0; i < strlen(buffer); ++i) 
            putchar( toupper(buffer[i]) );
    }
    state = 0;
    printf("%s", yytext);
}

. { 
    if(state == 1)
        printf("%s", buffer);
    state = 2;
    printf("%s", yytext);
}

"/*"([^*]|"*"+[^"*""/"])*"*"*"*/" {
    state = 0;
    printf("%s", yytext);
}

"//"([^*]|"*"+[^"*""/"])*"*"*"*/" {
    state = 0;
    printf("%s", yytext);
}

%%

int main() {
    yylex();
    if(state == 1)
        for (int i = 0; i < strlen(buffer); ++i)
                putchar( toupper(buffer[i]) );
    return 0;
}
