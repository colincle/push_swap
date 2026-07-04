NAME	= push_swap

CC		= cc
FLAGS	= -Wall -Werror -Wextra -g

SRC_DIR	= src
OBJ_DIR	= obj
INC		= -I./includes -I./libft

LIBFT	= ./libft/libft.a

SRCS	=	error_check.c		\
			initialize.c		\
			main.c				\
			misc.c				\
			operations.c		\
			operations2.c		\
			operations3.c		\
			operations_utils.c	\
			push_cost.c			\
			push_cost_utils.c	\
			push_swap.c			\
			push_swap_utils.c	\
			push_swap_utils2.c	\
			targets.c			\
			targets_utils.c		\

OBJS	= $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

RM		= rm -f

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	$(CC) $(FLAGS) -o $(NAME) $(OBJS) $(LIBFT)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(FLAGS) $(INC) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(LIBFT):
	make -C libft

clean:
	make clean -C libft
	$(RM) -r $(OBJ_DIR)

fclean: clean
	make fclean -C libft
	$(RM) $(NAME)

re: fclean all

norm:
	norminette -R CheckForbiddenSourceHeader $(SRC_DIR) includes

.PHONY: all re clean fclean norm
