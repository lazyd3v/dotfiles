# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/rofai/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Powerlevel10k config
export POWERLEVEL9K_MODE="awesome-patched"
export DEFAULT_USER="rofai"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS="()"
export POWERLEVEL9K_VCS_GIT_HOOKS=(git-remotebranch)

# Plugins
plugins=(git git-extras ssh-agent zsh_reload history osx zsh-syntax-highlighting rbenv)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/sbin:$PATH"

# Configure FZF for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Setup node version manager
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
