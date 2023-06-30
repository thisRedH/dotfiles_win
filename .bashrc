#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'

PS1='\[\033[1;33m\][\[\033[1;31m\]\u\[\033[1;37m\]@\[\033[1;35m\]\h \[\033[0;37m\]\w\[\033[1;33m\]]\[\033[1;31m\]\$ \[\033[0m\]'
#PS1='[\u@\h \W]\$ '    Backup no color