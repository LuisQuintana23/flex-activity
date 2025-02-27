%{
#include <stdio.h>
%}
%%
[0-9]+    { printf("Número encontrado: %s\n", yytext); } 
[a-zA-Z]+@[a-zA-Z]+\.(com|org|net) { printf("Correo detectado: %s\n", yytext); }
#[a-fA-F0-9]{6} { printf("Código de color HEX detectado: %s\n", yytext); }
.         { printf("Otro carácter: %s\n", yytext); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
