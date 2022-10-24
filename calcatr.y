%{
    #include <stdio.h>
    void yyerror(char *mensaje);
    int yylex();    
%}

%union{
    int nint;
}

%token SUMA RESTA MULT DIV PI PF EOL 

%token <nint> ENTERO
%type <nint> operacion
%type <nint> termino
%type <nint> parentesis

%%
inicio      :   operacion EOL           { printf("=%i\n", $1); }
            ; 

operacion   :   termino SUMA operacion  { $$ = $1 + $3; }
            |   termino RESTA operacion { $$ = $1 - $3; }
            |   termino MULT operacion  { $$ = $1 * $3; }
            |   termino DIV operacion   { $$ = $1 / $3; }
            |   termino                 { $$ = $1; }
            ;

termino     :   ENTERO                  { $$ = $1; }
            |   PI parentesis PF        { $$ = $2; }
            ;


parentesis  :   termino SUMA parentesis  { $$ = $1 + $3; }
            |   termino RESTA parentesis { $$ = $1 - $3; }
            |   termino MULT parentesis  { $$ = $1 * $3; }
            |   termino DIV parentesis   { $$ = $1 / $3; }
            |   termino                  { $$ = $1; }
            ;
%%

void yyerror(char *mensaje) {
    fprintf(stderr, "Error: %s\n", mensaje);
}

int main() {
    yyparse();
    return 0;
}