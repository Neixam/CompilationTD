CC		=	gcc
ASM		=	nasm
CFLAGS	=	-Wall
AFLAGS	=	-f elf64
EXEC	=	ex2
SRCASM	=	ex2.asm
SRC		=	ex2.c

OBJASM 	=	$(SRCASM:.asm=a.o)

OBJC	=	$(SRC:.c=c.o)

# RULE

all			:	$(EXEC)

clean		:
	rm -rf $(OBJASM) $(OBJ)

mrproper	:	clean
	rm -rf $(EXEC)

re			:	mrproper all


# COMPILATION

$(EXEC)	:	$(OBJASM) $(OBJC)
	$(CC) -o $@ $^ $(CFLAGS)

%c.o		:	%.c
	$(CC) -o $@ -c $<

%a.o		:	%.asm
	$(ASM) $(AFLAGS) -o $@ $<
