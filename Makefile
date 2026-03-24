# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: egermen <egermen@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/10 00:06:24 by egermen           #+#    #+#              #
#    Updated: 2024/08/10 00:06:25 by egermen          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME    := minishell
CC      := gcc
CFLAGS  := -Wall -Wextra -Werror -g -I ./include -I ./libft
LIBFT   := libft

SRC     := check_builtin.c \
           echo_and_env.c \
           export_and_unset.c \
           cd_and_pwd.c \
           utils2.c \
           check.c \
           check_utils.c \
           dup_transaction.c \
           exec_free.c \
           exec_free2.c \
           exec.c \
           execve.c \
           expander.c \
           create_files_utils.c \
           create_files.c \
           heredoc_utils.c \
           heredoc.c \
           lexer.c \
           exit.c \
           main.c \
           parser.c \
           parser_control.c \
           signal.c \
           expander_utils.c \
           utils.c \
           exec_utils.c \
           utils3.c

OBJ     := $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@$(MAKE) -C $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ) -L$(LIBFT) -lft -lreadline -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(MAKE) clean -C $(LIBFT)
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)
	$(MAKE) fclean -C $(LIBFT)

re: fclean all

.PHONY: all clean fclean re
