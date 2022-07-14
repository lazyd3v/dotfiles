export ZSH=/Users/romanfayzullin/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Load NVM and Node only when needed
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=(nvim git)

# Powerlevel10k config
export POWERLEVEL9K_MODE="awesome-patched"
export DEFAULT_USER="rofai"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS="()"
export POWERLEVEL9K_VCS_GIT_HOOKS=(git-remotebranch)

# Plugins
plugins=(git git-extras ssh-agent history macos zsh-syntax-highlighting golang)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/sbin:$PATH"

# Configure FZF for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Computer name
export DEFAULT_USER="$(whoami)"

# Gcloud setup
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# 10ms for key sequences
KEYTIMEOUT=1

export EDITOR="nvim"

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

