%{
    #include <stdio.h>
    int count_lower_letters = 0;
%}

%%
[^A-Z]+    { printf("\nAll the other charecters except the upper case letters: %s", yytext); count_lower_letters++;}
.	 {};
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

