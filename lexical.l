%{
#include <stdio.h>
int count_lower_letters = 0;
int yywrap() {
    return 1;
}
%}

%%
[0-9]+    { printf("Number found: %s\n", yytext); }
[a-zA-Z]+@[a-zA-Z]+\.(com|org|net) { printf("Email detected: %s\n", yytext); }
#[a-fA-F0-9]{6} { printf("HEX color code detected: %s\n", yytext); }
w(x|y)z { printf("wxz or wyz\n"); }
[^A-Z]+    { printf("\nAll the other characters except the uppercase letters: %s\n", yytext); }
.         { printf("Other character: %s\n", yytext); }
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Use the following syntax: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        fprintf(stderr, "Error opening file: %s\n", argv[1]);
        return 1;
    }

    yyin = file;  // Asignamos el archivo a la entrada léxica
    yylex();  // Procesamos el archivo
    fclose(file);

    return 0;
}
