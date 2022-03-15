%{
/* exp-calculette.y */
/* Syntaxe des expressions */
#include <stdio.h>
#include <string.h>
int yylex();
void yyerror(char *);
extern int lineno;
%}
%union {
    int type;
    char name[32];
}

%token <type> INT
%token <type> FLOAT
%type 

%%
DeclVar:
       Type Vars
    ;

Type:  INT
    |  FLOAT
    ;

Vars:  ID resteVars
    ;

resteVars:
       ',' ID resteVars
    |
    ;
%%
int main(int argc, char** argv) {
  yyparse();
  return 0;
}
void yyerror(char *s){
  fprintf(stderr, "%s near line %d\n", s, lineno);
}
