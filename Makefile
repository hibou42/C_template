#***** Name *****#

NAME			=		template

#***** Sources / Objs *****#

SRC				=		z_test.c \

OBJS			=		$(SRC:.c=.o)

#***** Libft *****#

LIBFT			=		./libft/libft.a
MLIBFT			=		$(MAKE) -C libft

#***** Couleurs *****#

GREEN			=		\033[1;32m
BLUE			=		\033[0;94m
RED				=		\033[1;31m
ENDCOLOR		=		\033[0m
BG_G			=		\033[42m

#***** Textes *****#

START			=		echo "$(GREEN)Start compilation\n$(ENDCOLOR)"
END_COMP		=		echo "$(GREEN)End compilation\n$(ENDCOLOR)"
S_OBJS			=		echo "$(RED)Suppression des objets\n$(ENDCOLOR)"
S_NAME			=		echo "$(RED)Suppression du programme\n$(ENDCOLOR)"
CHARG_LINE		=		echo "$(BG_G)    $(ENDCOLOR)\c"
BS_N			=		echo "\n"

#***** Logo *****#

MSHELL			=		echo "$(GREEN) \t         _________ ______   _______          \n\
									 \t|\     /|\__   __/(  ___ \ (  ___  )|\     /|\n\
									 \t| )   ( |   ) (   | (   ) )| (   ) || )   ( |\n\
									 \t| (___) |   | |   | (__/ / | |   | || |   | |\n\
									 \t|  ___  |   | |   |  __ (  | |   | || |   | |\n\
									 \t| (   ) |   | |   | (  \ \ | |   | || |   | |\n\
									 \t| )   ( |___) (___| )___) )| (___) || (___) |\n\
									 \t|/     \|\_______/|/ \___/ (_______)(_______)$(ENDCOLOR)\n"

#***** Flags *****#

CC				=		gcc
CFLAGS			=		-Wall -Wextra -Werror -g
L				=		$(CFLAGS) -fsanitize=address
RM				=		rm -f

#***** Compilation *****#

all : lib start logo $(NAME)

lib:
			@$(MLIBFT) all
			@$(END_COMP_LIB)

start:
			@$(START)

logo :
			@$(MSHELL)	

%.o:		%.c ./libft/libft.h Makefile
			@$(CC) $(CFLAGS) -c $< -o $@
			@$(CHARG_LINE)

$(NAME) :	${OBJS}
			@$(BS_N)
			@${CC} ${CFLAGS} -o ${NAME} ${OBJS} ${LIBFT}
			@$(END_COMP)

l :			${OBJS}
			${MLIBFT} all
			${CC} ${L} -o ${NAME} ${OBJS} ${LIBFT}
			@$(END_COMP)

test: 		all
			${CC} ${CFLAGS} ${OBJS} z_test.c
			./a.out
			rm a.out &&  rm *.o
			make fclean			

#***** Clean *****#

clean:
			@$(S_OBJS)
			${RM} ${OBJS}
			${MLIBFT} clean

fclean:		clean
			@$(S_NAME)
			${RM} ${NAME}
			${MLIBFT} fclean

re:			fclean all

.PHONY:		all clean fclean 
