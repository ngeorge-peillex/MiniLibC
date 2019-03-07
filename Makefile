##
## EPITECH PROJECT, 2017
## Makefile
## File description:
## makefile of the source file
##

SOURCES	=	./sources

LINK	=	ld

CC		=	nasm

CFLAGS	=	-fPIC -shared

NAME	=	libasm.so

SRC		=	$(SOURCES)/strlen.asm\
			$(SOURCES)/strchr.asm\
			$(SOURCES)/memset.asm\
			$(SOURCES)/memcpy.asm\
			$(SOURCES)/strcmp.asm\
			$(SOURCES)/rindex.asm\
			$(SOURCES)/strstr.asm\
			$(SOURCES)/strncmp.asm\
			$(SOURCES)/strcspn.asm\
			$(SOURCES)/strpbrk.asm\
			$(SOURCES)/strcasecmp.asm\

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
