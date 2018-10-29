# This should fix a bug where Ctrl-s gets caught by screen
if [ -t 0 ]; then #only run if stdin is a terminal
        stty ixany
fi

# Short circuit if this is a non-interactive shell (rsync or such)
[[ $- != *i* ]] && return

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi

# Environment variable definitions.
if [ -f ~/.bash_env ]; then
        . ~/.bash_env
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# Work specific stuff
 if [ -f ~/.bash_work ]; then
        . ~/.bash_work
fi

# Bash Prompt
shopt -s checkwinsize # check the window size after each command and update the values of LINES and COLUMNS.
shopt -s histappend # append to the history file, don't overwrite it
if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
else
        # Set prompt to look like this "user@hostname: 08:46:29 ~ > "
        PS1='\[\e[1;30m\]\[\e[1;34m\]\u@\H\[\e[1;38m\]: $(date +%T) \[\e[1;37m\]\w\[\e[0;37m\] \n> '
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
