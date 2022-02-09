## editor
export EDITOR=nvim
export VISUAL=nvim

## color
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS

## umask
umask 022

## chpwd
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent_dirs_max     500
zstyle ':chpwd:*' recent_dirs_default true
zstyle ':chpwd:*' recent_dirs_files   "${ZDOTDIR}/.chpwd-recent-dirs"
zstyle ':chpwd:*' recent_dirs_pushd   true

## preztj
if [[ -s "${XDG_CONFIG_HOME}/prezto/init.zsh" ]]; then
  source "${XDG_CONFIG_HOME}/prezto/init.zsh"
fi

## auto suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#444'

## fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!*.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse'

if [[ -e /proc/version ]]; then
  FZF_HOME=/usr/share/doc/fzf/examples
elif [[ "$OSTYPE" == darwin* ]]; then
  FZF_HOME=/opt/homebrew/opt/fzf/shell
else
  FZF_HOME=''
fi

if [[ -n "$FZF_HOME" ]]; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!*.git"'
  export FZF_DEFAULT_OPTS='--height 40% --reverse'

  if [[ $- == 'i' ]]; then
    source "${FZF_HOME}/completion.zsh" 2> /dev/null
  fi
  source "${FZF_HOME}/key-bindings.zsh" 2> /dev/null
fi

## key bindings
bindkey -r       '^t'
bindkey -M viins 'jk' vi-cmd-mode

## starship
eval "$(starship init zsh)"

## aliases
alias ll='ls -lhv'

## post processing
typeset -gU cdpath fpath mailpath path
