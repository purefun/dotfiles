ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
plugins=(git)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.dapr/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim
export HTTP_PROXY=http://127.0.0.1:6152
export HTTPS_PROXY=http://127.0.0.1:6152
export GLOBAL_AGENT_HTTP_PROXY=http://127.0.0.1:6152
export NO_PROXY=
export TERM=xterm-256color
export ZSH="/Users/Nil/.oh-my-zsh"
export BAT_THEME="Nord"
export GPG_TTY=$(tty)
export HOMEBREW_NO_AUTO_UPDATE=1

alias vim="nvim"
alias gs="git status"
alias cat="bat"
alias ll="ls -la"
alias tc="clear;tmux clear-history;clear"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

DEFAULT_NODE_VERSION='14.15.3'
# Ensure we have a default node version in our PATH at startup
if [ -d "${HOME}/.nvm/versions/node/v${DEFAULT_NODE_VERSION}/bin" ] ; then
  PATH="${HOME}/.nvm/versions/node/v${DEFAULT_NODE_VERSION}/bin:${PATH}"
fi

