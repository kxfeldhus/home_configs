# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias l='ls -CF'

# Rails
alias s-c='script/console'
alias s-s='script/server'
alias be='bundle exec'
alias bc='bundle console'

# Subversion
alias svs='svn status'
alias svu='svn update'
alias svndiff='svn diff -x -bw '
alias svndiffvim='svn diff --diff-cmd ~/bin/svnvimdiff'

# General
alias tf='tail -f'
alias tt='tail -1000'
alias s='screen'
alias top='top -u $USER'

# Grep and exclude .svn
function g() { eval "egrep -r -n" "$@" "| grep -v '\.svn'" ; }

alias todo="todotxt"

# ssh and pass the current STY var through, this will have the
# affect of telling the remote that you are ssh'ing from a 
# screen session, or not.
function sshh() { ssh -t -X $@ 'export STY='"'$STY'"';bash'; }
