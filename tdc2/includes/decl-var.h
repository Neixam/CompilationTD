/* decl-var.h */
/* Analyse descendante récursive des déclarations de variables en C */
#define MAXNAME 32
typedef struct {
    char name[MAXNAME];
    int type;
} STentry;
#define INTEGER 0
#define REAL 1

#define INT 256
#define FLOAT 257
#define IDENT 258

extern char yylval[MAXNAME];

void check(int token);
void addVar(const char name[], int type);
void syntaxError();
void decl_var(void);
int type(void);
void vars(int type);
void reste_vars(int type);
