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
    int num;
    char comp[3];
    char addsub;
    char divstar;
}

%token <num> NUM
%token <comp> EQ
%token <addsub> ADDSUB
%token <divstar> DIVSTAR
%token OR AND
%type <num> L EB TB FB E T F

%%
L   :  EB '.'       { printf("%d\n", $1); }
    ; 
EB  :  EB OR TB     { $$ = $1 || $3; }
    |  TB
    ;
TB  :  TB AND FB    { $$ = $1 && $3; }
    |  FB
    ;
FB  :  E EQ E       { $$ = (!strcmp(yylval.comp, "==")) ? $1 == $3 : $1 != $3; }
    |  E
    ;
E   :  E ADDSUB T   { $$ = (yylval.addsub == '+') ? $1 + $3 : $1 - $3; }
    |  T
    ;    
T   :  T DIVSTAR F  { $$ = (yylval.divstar == '*') ? $1 * $3 : $1 / $3; }
    |  F
    ;
F   :  ADDSUB F     { $$ = ((yylval.addsub == '+') ? 1 : -1) * $2; }
    |  '!' F        { $$ = !($2); }
    |  '(' EB ')'   { $$ = $2; }
    |  NUM          { $$ = yylval.num; }
    ;
%%
int main(int argc, char** argv) {
  yyparse();
  return 0;
}
void yyerror(char *s){
  fprintf(stderr, "%s near line %d\n", s, lineno);
}
