%{
    #include <stdio.h>
    int count_lower_letters = 0;
%}

WXZ w(x|y)z

%%
{WXZ} { printf("wxz or wyz: %s", yytext);}
[0-9]+    { printf("Number detected: %s\n", yytext); }
a{2,4}    { printf("either aa, aaa or aaaa: %s", yytext); }
[a-zA-Z]+@[a-zA-Z]+\.(com|org|net) { printf("E-mail detected: %s\n", yytext); }
#[a-fA-F0-9]{6} { printf("Hexadecimal color detected: %s\n", yytext); }
.         { printf("Another character: %s\n", yytext); }
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Use the following syntax: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        printf("Error opening the file\n");
        return 1;
    }

    yyin = file;
    yylex();

    printf("\nNumber of all the other charecters except the upper case letters: %d\n", count_lower_letters);

    fclose(file);
    return 0;
}

int yywrap() {
    return 1;
}

