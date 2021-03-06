#  Auteur       : Bourennane Amine
#  Creation     : 17-10-2020
#  Modification : 17-10-2020

#	Variable

CC      =	gcc
CFLAGS  =	-Wall
LDFLAGS =   -Wall -lfl -ly
EXEC    = 	exp-calculette
SCRIPT	=	test_bash.sh
RESULT	=	resultat.txt
INC_PATH=	include/
SRC_PATH=	$(find src -type d)
OBJ_PATH=	$(foreach rep, $(SRC), $(rep))

# Bison file
YAC		:=	$(EXEC).y
YSRC	:=	src/yac/$(YAC:.y=).tab.c
YOBJ	:=	$(patsubst src%, obj%, $(YSRC:.c=.o))
YINC	:=	$(patsubst src/yac%, include%, $(YSRC:.c=.h))
YTAB    :=  $(YAC:.y=.output)
YGRA	:=	$(YAC:.y=.dot)
YPDF	:=	$(YAC:.y=.pdf)

# Flex file
LEX		:=	$(EXEC).lex
LSRC	=	src/lex/lex.yy.c
LOBJ	=	$(patsubst src%, obj%, $(LSRC:.c=.o))

#	Compilation

$(EXEC)		:	$(YOBJ) $(LOBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

$(SCRIPT)	:	$(EXEC)
	./$@

$(YTAB)     :	$(YAC)
	bison -v -o $@ $<

$(YPDF)		:	$(YGRA)
	dot -Tpdf -o $@ $<

$(YGRA)		:	$(YAC)
	bison -g -o $@ $<

$(YOBJ)		:	$(YSRC)
	@mkdir -p obj obj/yac
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INC_PATH)

$(LOBJ)		:	$(LSRC) 
	@mkdir -p obj obj/lex
	$(CC) -o $@ -c $< $(CFLAGS) -I $(INC_PATH)

$(LSRC)		:	$(LEX)
	flex -o $@ $<

$(YSRC)		:	$(YAC)
	@mkdir -p $(INC_PATH)
	bison -d -o $@ $<
	@mv $(YSRC:.c=.h) $(INC_PATH)

#	Rules

all		:	$(EXEC)

test	:	$(SCRIPT)
	@cat $(RESULT)

table	:   $(YTAB)

graph	:	$(YPDF)
	@evince $< &

clean	:
	rm -f $(YSRC) $(YOBJ) $(LSRC) $(LOBJ) $(YINC) $(RESULT) $(YTAB) $(YPDF) $(YGRA)

mrproper:	clean
	rm -rf obj/ include/ $(EXEC)

re		:	mrproper all
