export ZSH=/Users/rofai/.oh-my-zsh

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
plugins=(git git-extras ssh-agent zsh_reload history osx zsh-nvm zsh-syntax-highlighting rbenv)

# Init oh-my-zsh
source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/sbin:$PATH"

# Configure FZF for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

