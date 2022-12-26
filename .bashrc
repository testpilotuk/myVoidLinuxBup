# .bashrc
# If not running interactively, don't do anything 
[[ $- != *i* ]] && return

# Source global definitions from /etc/bashrc
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Make Less the default pager
export PAGER=less

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"

# Use colors assigned in LESS_TERMCAP to make man pages easier to read 
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Assign VIM as text editor
EDITOR=/usr/bin/vim
export EDITOR

# Increase the maximum number of lines in your history file
# to 1000 and ignore duplicate commands
export HISTFILESIZE=1000
export HISTCONTROL=ignoredups

## Append to history file; do not overwrite
shopt -s histappend

## Prevent accidental overwrites when using IO redirection
set -o noclobber

# User specific aliases 
alias vb="$EDITOR ~/.bashrc"
alias va="$EDITOR ~/.config/alacritty/alacritty.yml"
alias l.='exa -d .*'
alias la='exa -lahF'
alias ll='exa -l'
alias ls='exa'
alias reload='. ~/.bashrc'
 
# starship bash prompt
eval "$(starship init bash)"

# functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Start Neofetch
neofetch
