%{
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int state = 0;     // 0：可接受关键字；1：接受关键字；2：错误
char buffer[20]; // 用于保存关键字在下一次输出

%}


%option noyywrap

%%

[" "\n\t;()]|"{".*"}" {
    if(state == 1){
        for (int i = 0; i < strlen(buffer); ++i) 
            putchar( toupper(buffer[i]) );
    }
    state = 0;
    printf("%s", yytext);
}

int|long|short|float|double|char|unsigned|signed|const|void|volatile|enum|struct|union
|if|else|goto|switch|case|do|while|for|continue|break|return|default|typedef|auto|
register|extern|static|sizeof {
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

. { 
    if(state == 1)
        printf("%s", buffer); 
    state = 2;
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
