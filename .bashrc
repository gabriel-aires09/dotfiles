# Configure color-scheme
COLOR_SCHEME=dark # dark/light

### Colorize commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto' ### remove this if you are using another distro than arch-based

### LS & TREE
command -v lsd > /dev/null && alias ls='lsd --group-dirs first' && \
	alias tree='lsd --tree'
command -v colorls > /dev/null && alias ls='colorls --sd --gs' && \
	alias tree='colorls --tree'

### TOP
command -v htop > /dev/null && alias top='htop'
command -v gotop > /dev/null && alias top='gotop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
command -v ytop > /dev/null && alias top='ytop -p $([ "$COLOR_SCHEME" = "light" ] && echo "-c default-dark")'
command -v btm > /dev/null && alias top='btm $([ "$COLOR_SCHEME" = "light" ] && echo "--color default-light")'
# themes for light/dark color-schemes inside ~/.config/bashtop; Press ESC to open the menu and change the theme
command -v bashtop > /dev/null && alias top='bashtop'
command -v bpytop > /dev/null && alias top='bpytop'

# --------------------------------- SETTINGS ----------------------------------
shopt -s globstar
shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000
HISTFILE=~/.bash_history

# Bash Completion
if [ -f /usr/share/bash-completion/bash_completion ]
then
	source /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]
then
	source /etc/bash_completion
fi

# Prompt
PS1='\[\033[;32m\]┌──(\[\033[1;34m\]\u@\h\[\033[;32m\])-[\[\033[0;1m\]\w\[\033[;32m\]]\n\[\033[;32m\]└─\[\033[1;34m\]\$\[\033[0m\] '

# ----------------------------------- MISC -----------------------------------
export VISUAL=vim
export EDITOR=$VISUAL

# enable terminal linewrap
setterm -linewrap on 2> /dev/null

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

# colorize ls
[ -x /usr/bin/dircolors ] && eval "$(dircolors -b)"

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;\u@\h: \w\a\]$PS1"
	;;
esac

# PATH
export PATH="/home/resetim/.local/bin:$PATH"
