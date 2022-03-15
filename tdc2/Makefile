#  Auteur       : Bourennane Amine
#  Creation     : 17-10-2020
#  Modification : 17-10-2020

#	Variable

CC      =	gcc
CFLAGS  =	-Wall
LDFLAGS =   -Wall -lfl -ly
EXEC    = 	decl-var
INC_PATH=	includes/
SRC_PATH=	$(find src -type d)
OBJ_PATH=	$(foreach rep, $(SRC), $(rep))

# C file
SRC		=	src/$(EXEC).c
OBJ		=	$(patsubst src%, obj%, $(SRC:.c=.o))
HEADER	=	$(INC_PATH)$(EXEC).h

# Flex file
LEX		:=	$(EXEC).lex
LSRC	=	src/lex/lex.yy.c
LOBJ	=	$(patsubst src%, obj%, $(LSRC:.c=.o))

#	Rules

all		:	$(EXEC)

clean	:
	rm -f $(LSRC) $(LOBJ) $(OBJ)

mrproper:	clean
	rm -rf obj/ $(EXEC)

re		:	mrproper all

#	Compilation

$(EXEC)			:	$(OBJ) $(LOBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJ)			:	$(SRC) $(HEADER)
	@mkdir -p obj
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INC_PATH)

$(LOBJ)			:	$(LSRC) $(HEADER)
	@mkdir -p obj obj/lex
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INC_PATH)

$(LSRC)			:	$(LEX)
	flex -o $@ $<
