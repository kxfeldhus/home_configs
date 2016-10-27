# # This should fix a bug where Ctrl-s gets caught by screen
# if [ -t 0 ]; then #only run if stdin is a terminal
#         stty ixany
# fi

# # Short circuit if this is a non-interactive shell (rsync or such)
# [[ $- != *i* ]] && return

# HISTCONTROL=ignoredups:ignorespace:erasedups #don't put duplicate lines in the history
# HISTSIZE=10000000
# HISTFILESIZE=1000000
# HISTTIMEFORMAT="%Y%m%d %H:%M:%S "

# shopt -s checkwinsize # check the window size after each command and update the values of LINES and COLUMNS.
# shopt -s histappend # append to the history file, don't overwrite it

# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# unset PROMPT_COMMAND
# #export PROMPT_COMMAND="history -n;history -w;history -c;history -r;$PROMPT_COMMAND"
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


# # Environment variable definitions.
# if [ -f ~/.bash_env ]; then
#         . ~/.bash_env
# fi

# # Alias definitions.
# if [ -f ~/.bash_aliases ]; then
#         . ~/.bash_aliases
# fi

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#         . /etc/bash_completion
# fi

# # Work specific stuff
#  if [ -f ~/.bash_work ]; then
#         . ~/.bash_work
# fi
# # Bash Prompt

# if [ -f ~/.bash_prompt ]; then
#         . ~/.bash_prompt
# else
#         # Set prompt to look like this "user@hostname: 08:46:29 ~ > "
#         PS1='\[\e[1;30m\]\[\e[1;34m\]\u@\H\[\e[1;38m\]: $(date +%T) \[\e[1;37m\]\w\[\e[0;37m\] \n> '
# fi

# # GNU Screen welcome window session selector
# # if [ -f ~/.bash_screen ]; then
# #         . ~/.bash_screen
# # fi
# # if [[ -z "$TMUX" ]] ;then
# #         ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
# #         if [[ -z "$ID" ]] ;then # if not available create a new one
# #                 tmux new-session
# #         else
# #                 tmux attach-session -t "$ID" # if available attach to it
# #         fi
# # fi

# # TMUX stuff
# settitle() {
#   printf "\033k$1\033\\"
# }
# ssh() {
#   settitle "$*"
#   command ssh "$@"
#   settitle "bash"
# }
