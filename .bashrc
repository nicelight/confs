
# AUTOCOLOR {{{
alias ls='ls --color=auto -a'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#}}}
# MODIFIED COMMANDS {{{
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias df='df -h'
alias diff='colordiff'              # requires colordiff package
alias du='du -c -h'
alias free='free -m'                # show sizes in MB
alias grep='grep --color=auto'
alias grep='grep --color=tty -d skip'
alias mkdir='mkdir -p -v'
alias more='less'
alias nano='nano -w'
alias c='clear && clear'
#}}}
# PRIVILEGED ACCESS {{{
if ! $_isroot; then
  alias sudo='sudo '
  alias scat='sudo cat'
  alias svim='sudoedit'
  alias root='sudo su'
  alias reboot='sudo reboot'
  alias halt='sudo halt'
  alias powertop='sudo powertop'
fi
#}}}
# LS {{{
alias ls='ls -hF --color=auto'
alias l='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -alh'
alias la='ll -A'
alias lm='la | less'
#}}}
#}}}


#alias for activating env1
#python virtualenv alias
alias venv='source ~/env1/bin/activate'
alias notes='vim ~/notes.txt'
alias speedtest=~/speedtest
alias utime='sudo ntpdate pool.ntp.org'
# PS1 CONFIG {{{
[[ -f $HOME/.dircolors ]] && eval $(dircolors -b $HOME/.dircolors)
if $_isxrunning; then

  [[ -f $HOME/.dircolors_256 ]] && eval $(dircolors -b $HOME/.dircolors_256)

  export TERM='xterm-256color'

  B='\[\e[1;38;5;33m\]'
  LB='\[\e[1;38;5;81m\]'
  GY='\[\e[1;38;5;242m\]'
  G='\[\e[1;38;5;82m\]'
  P='\[\e[1;38;5;161m\]'
  PP='\[\e[1;38;5;93m\]'
  R='\[\e[1;38;5;196m\]'
  Y='\[\e[1;38;5;214m\]'
  W='\[\e[0m\]'

  get_prompt_symbol() {
    [[ $UID == 0 ]] && echo "#" || echo "\$"
  }

  if [[ $PS1 && -f /usr/share/git/git-prompt.sh ]]; then
    source /usr/share/git/completion/git-completion.bash
    source /usr/share/git/git-prompt.sh

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=0

    export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W\$(__git_ps1 \"$GY|$LB%s\")$GY]$W\$(get_prompt_symbol) "
  else
    export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W$GY]$W\$(get_prompt_symbol) "
  fi
else
  export TERM='xterm-color'
fi
#}}}



# COLORED MANUAL PAGES {{{
# @see http://www.tuxarena.com/?p=508
# For colourful man pages (CLUG-Wiki style)
if $_isxrunning; then
  export PAGER=less
  export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\E[0m'           # end mode
  export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\E[0m'           # end underline
  export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi
#}}}
# OVERALL CONDITIONALS {{{
_islinux=false
[[ "$(uname -s)" =~ Linux|GNU|GNU/* ]] && _islinux=true

_isarch=false
[[ -f /etc/arch-release ]] && _isarch=true

_isxrunning=false
[[ -n "$DISPLAY" ]] && _isxrunning=true

_isroot=false
[[ $UID -eq 0 ]] && _isroot=true
# }}}



# BASH OPTIONS {{{
shopt -s cdspell                 # Correct cd typos
shopt -s checkwinsize            # Update windows size on command
shopt -s histappend              # Append History instead of overwriting file
shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s expand_aliases
shopt -s extglob                 # Extended pattern
shopt -s no_empty_cmd_completion # No empty completion
# COMPLETION {{{
complete -cf sudo
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi
#}}}
#}}}
# CONFIG {{{
export PATH=/usr/local/bin:$PATH
if [[ -d "$HOME/bin" ]] ; then
  PATH="$HOME/bin:$PATH"
fi

export EDITOR="vim"

#}}}
# BASH HISTORY {{{
# make multiple shells share the same history file
export HISTSIZE=1000            # bash history will save N commands
export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
#}}}

if [[ $- == *i* ]] && [ -x "$(command -v fish)" ]; then
    exec fish 
fi

