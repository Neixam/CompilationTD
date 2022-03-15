/* decl-var.c */
/* Traduction descendante récursive des déclarations de variables en C */
/* Compatible avec decl-var.lex */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "decl-var.h"
extern int lineno;  /* from lexical analyser */
int yylex();

int lookahead;
#define MAXSYMBOLS 256
STentry *symbolTable;
int STmax=MAXSYMBOLS; /* maximum size of symbol table */
int STsize=0;         /* size of symbol table */
char yylval[MAXNAME];

void check(int token) {
    if (token!=lookahead) {
        syntaxError();
        exit(1);
    }
}

void addVar(const char name[], int type){
    int count;
    printf("%s %s\n", (type == INTEGER) ? "int" : "float", name);
    for (count=0;count<STsize;count++) {
        if (!strcmp(symbolTable[count].name,name)) {
            printf("semantic error, redefinition of variable %s near line %d\n",
            name, lineno);
            return;
        }
    }
    if (++STsize>STmax) {
        printf("too many variables near line %d\n", lineno);
        exit(1);
    }
    strcpy(symbolTable[STsize-1].name, name);
    symbolTable[STsize-1].type=type;
}

int type(void)
{
    if (lookahead == INT)
    {
        lookahead = yylex();
        return (INTEGER);
    }
    if (lookahead == FLOAT)
    {
        lookahead = yylex();
        return (REAL);
    }
    syntaxError();
    return (0);
}

void vars(int type)
{
    if (lookahead == IDENT)
    {
        addVar(yylval, type);
        lookahead = yylex();
        reste_vars(type);
    }
}

void reste_vars(int type)
{
    if (lookahead == ',')
    {
        lookahead = yylex();
        if (lookahead == IDENT)
        {
            addVar(yylval, type);
            lookahead = yylex();
            reste_vars(type);
        }
        else
            syntaxError();
    }
}

void decl_var(void)
{
    int t;

    t = type();
    vars(t);
    check(';');
    lookahead = yylex();
}

void syntaxError(){
    fprintf(stderr, "syntax error near line %d\n", lineno);
    exit(1);
}

int main() {
    int i;
    symbolTable=(STentry*)malloc(STmax*sizeof(*symbolTable));
    if (!symbolTable) {
        printf("Run out of memory\n");
        exit(1);
    }
    lookahead=yylex();
    while (lookahead == INT || lookahead == FLOAT)
        decl_var();
    check(0);
    printf("\n");
    for (i = 0; i < STsize; i++)
        printf("%s %s\n", (symbolTable[i].type == INTEGER) ? "int" : "float", symbolTable[i].name);
    free(symbolTable);
    return 0;
}
