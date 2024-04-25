# Print the first prompt and redirect standard file descriptors.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export HISTFILE=$HOME/.config/zsh_history
export HISTSIZE=1000000
export SSH_KEY_PATH="~/.ssh/rsa_id"
export FZF_DEFAULT_COMMAND='fd --type f'
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zcompdump-$ZSH_VERSION # needed for export, and use with compinit

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Shared between Bash and Zsh (aliases, exports, sources, ...)
FILE=~/.config/sharedrc && test -f "$FILE" && source "$FILE"

# Needed for conflict between fzf and zsh-vi-mode (Initialization when the script is sourced)
ZVM_INIT_MODE=sourcing

# Before antidote
autoload -Uz compinit && compinit -d $ZSH_COMPDUMP

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load $HOME/.config/zsh_plugins.txt

# Specific Zsh's Vim Binding
bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.config/p10k.zsh.
# export POWERLEVEL9K_CONFIG_FILE="$HOME/.config/p10k.zsh"
# [[ ! -f ~/.config/p10k.zsh ]] || source ~/.config/p10k.zsh
