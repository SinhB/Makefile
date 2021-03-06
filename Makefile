# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yabecret <yabecret@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/04/05 13:54:12 by yabecret          #+#    #+#              #
#    Updated: 2019/04/05 14:43:58 by yabecret         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Executable
NAME	=	<exec_name>

# Compilation
CC			=	@cc
CFLAGS		=	-Wall -Wextra -Werror
CPPFLAGS	=	-Iincludes

# Files && Objs

SRC_PATH	= srcs

OBJ_PATH	= objs

INC_PATH	= includes

LDFLAGS		= -Llibft
LDLIBS		= -lft

SRC_NAME 	=
				<source_name>							\


OBJ_NAME = $(SRC_NAME:.c=.o)

SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))

OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

# **************************************************************************** #

# SPECIAL CHARS

LOG_CLEAR		= \033[2K
LOG_UP			= \033[A
LOG_NOCOLOR		= \033[0m
LOG_BOLD		= \033[1m
LOG_UNDERLINE	= \033[4m
LOG_BLINKING	= \033[5m
LOG_BLACK		= \033[1;30m
LOG_RED			= \033[1;31m
LOG_GREEN		= \033[1;32m
LOG_YELLOW		= \033[1;33m
LOG_BLUE		= \033[1;34m
LOG_VIOLET		= \033[1;35m
LOG_CYAN		= \033[1;36m
LOG_WHITE		= \033[1;37m

# Protect

.PHONY:	all clean fclean re

# **************************************************************************** #

# RULES

# Main rules
all				: 	$(OBJ_PATH) $(NAME)

re				: 	fclean all

# Compilation rules
$(OBJ_PATH)		:
					@mkdir $(OBJ_PATH) 2> /dev/null || true


$(NAME)			:	$(OBJ)
					@echo "-------------------------------------------------------------"
					@echo "|                  Debut de la compilation                  |"
					@echo "|                            42                             |"
					@echo "|                          <project_name>                            |"
					@echo "|                       compilation :                       |"
					@echo "|                                                           |"
					#@ar rc $(NAME) $^
					#@ranlib $(NAME)
					@echo "|                       make $(NAME)$(LOG_GREEN) ✓ $(LOG_NOCOLOR)                     |"
					@echo "-------------------------------------------------------------"

$(OBJ_PATH)/%.o: 	$(SRC_PATH)/%.c
					$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

# Clean rules
clean			:
					@echo "-------------------------------------------------------------"
					@rm -rf $(OBJ_PATH)
					@echo "|                    Removes all .o & $(OBJ_PATH)/$(LOG_GREEN) ✓ $(LOG_NOCOLOR) !            |"
					@echo "-------------------------------------------------------------"

fclean			: 	clean
					@echo "-------------------------------------------------------------"
					@rm -f $(NAME)
					@echo "|                    Remove $(NAME)$(LOG_GREEN) ✓ $(LOG_NOCOLOR) !                    |"
					@echo "-------------------------------------------------------------"
norme:
					@norminette $(SRC)
					@norminette $(INC_PATH)/
# **************************************************************************** #
