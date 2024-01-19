# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

neofetch
## Auto cd into folder only by folder name
shopt -s autocd

# Aliases
alias mcd='function _mcd(){ mkdir -p "$1"; cd "$1"; };_mcd'
alias ls="${aliases[ls]:-ls} -a --color=auto"
alias ls.='${aliases[ls]:-ls} -a --color=auto | grep "^\."'
alias vim="nvim"
alias fup='sudo dnf update -y && sudo dnf upgrade -y'
alias ..='cd ..'
alias ...=' cd ../..'
alias grep='grep --color=auto'
alias shutdown='sudo shutdown now'
alias myip='curl ipinfo.io/ip' 
alias c='clear'
alias vi='vim'
## File Extraction
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)     ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### COUNTDOWN   
cdown () {
    N=$1
  while [[ $((--N)) >  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}

PS1='\[\e[38;5;30;1m\]\w\[\e[0m\] \[\e[2m\]~\[\e[0m\] $(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \n\$ '



#NNN plugins
#export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'

#Ignore case sensitivty in tab completion
bind 'set completion-ignore-case on'
