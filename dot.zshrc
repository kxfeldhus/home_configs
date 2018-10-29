# Path to your oh-my-zsh installation.
export ZSH=/Users/kfeldhus/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(vi-mode git tmux scala osx)
plugins=(git tmux scala osx) # Disabled vi-mode for now

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


VIM_INS_MODE="%{$fg[cyan]%}[INS]%{$reset_color%}"
VIM_CMD_MODE="%{$fg[green]%}[CMD]%{$reset_color%}"
VIM_MODE=$VIM_INS_MODE

function zle-keymap-select {
  VIM_MODE="${${KEYMAP/vicmd/${VIM_CMD_MODE}}/(main|viins)/${VIM_INS_MODE}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  VIM_MODE=$VIM_INS_MODE
}
zle -N zle-line-finish


# === PROMPT ===
setopt prompt_subst

autoload -U promptinit
promptinit

PROMPT="%{$fg_bold[white]%}%n@%m:%~%{$fg[white]%}% %{$reset_color%}
%{$fg_bold[red]%}>%{$reset_color%}"

#RPROMPT='${VIM_MODE}%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}[%*]'
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%}[%*]' # Disable vi-mode for now


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

# Prompt definitions.
setopt histappend # append to the history file, don't overwrite it
unsetopt share_history # Don't reload the history after each command, so I can keep tmux instances separate
if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
