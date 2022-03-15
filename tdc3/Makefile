# VARIABLE

CC		=	gcc
ASM		=	nasm
CFLAGS	=	-nostartfiles -no-pie
AFLAGS	=	-f elf64
EXEC	=	ex6
SRC		=	utils.asm \
			squelette.asm \

OBJ 	=	$(SRC:.asm=.o)


# RULE

all			:	$(EXEC)

clean		:
	rm -rf $(OBJ)

mrproper	:	clean
	rm -rf $(EXEC)

re			:	mrproper all


# COMPILATION

$(EXEC)	:	$(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

%.o		:	%.asm
	$(ASM) $(AFLAGS) -o $@ $<
