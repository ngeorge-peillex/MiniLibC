##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## makefile of the source file
##

SOURCES	=	./sources

INC_DIR =	./Includes

LINK	=	ld

CC		=	nasm

CFLAGS	=	-fPIC -shared

NAME	=	my_nmlibasm.so

SRC		=	$(SOURCES)/strlen.asm

OBJS	=	$(SRC:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(LINK) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
		$(CC) -f elf64 $< -o $@

clean:
	@rm -f $(OBJS)

fclean: clean
	@rm -f $(NAME)

re:		fclean all

.PHONY: fclean clean all re
