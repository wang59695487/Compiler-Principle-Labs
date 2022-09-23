int main() {
    yylex();
    if(state == 1)
        for (int i = 0; i < strlen(buffer); ++i)
                putchar( toupper(buffer[i]) );
    return 0;
}

