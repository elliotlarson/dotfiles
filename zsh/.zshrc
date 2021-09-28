# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

DISABLE_AUTO_UPDATE="true"

# if [[ -z "${USING_RUBYMINE_TERMINAL}" ]]; then
#   source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

#   POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#   POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#   POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#   POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "
#   # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="◉ "
#   # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
#   POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#   POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# else
#   ZSH_THEME="elliot"
# fi
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins+=(docker)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/opt/libiconv/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. /usr/local/opt/asdf/asdf.sh
