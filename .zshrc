export EDITOR=nvim
export VISUAL=nvim
alias vim="nvim"

export ZSH="/Users/Nil/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias gs="git status"
alias cat="bat"
alias ll="ls -la"

export HTTP_PROXY=http://127.0.0.1:6152
export HTTPS_PROXY=http://127.0.0.1:6152
export GLOBAL_AGENT_HTTP_PROXY=http://127.0.0.1:6152
export NO_PROXY=

export TERM=xterm-256color

alias tc="clear;tmux clear-history;clear"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export BAT_THEME="Nord"

export GPG_TTY=$(tty)

export PATH="$HOME/.dapr/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

DEFAULT_NODE_VERSION='14.15.3'
# Ensure we have a default node version in our PATH at startup
if [ -d "${HOME}/.nvm/versions/node/v${DEFAULT_NODE_VERSION}/bin" ] ; then
  PATH="${HOME}/.nvm/versions/node/v${DEFAULT_NODE_VERSION}/bin:${PATH}"
fi

alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
