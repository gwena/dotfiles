export HISTFILE=$HOME/.config/zsh_history
export HISTSIZE=1000000 # history in memory
export SAVEHIST=1000000 # history in file
export FZF_DEFAULT_COMMAND='fd --type f'
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zcompdump-$ZSH_VERSION # needed for export, and use with compinit

setopt hist_ignore_space # prevent history entry to be recorded if started with at least one space

HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"

# Needed for conflict between fzf and zsh-vi-mode (Initialization when the script is sourced)
ZVM_INIT_MODE=sourcing

# Before Antidote
autoload -Uz compinit && compinit -d $ZSH_COMPDUMP

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load "$HOME/.config/zsh_plugins.txt"

# Work with eza as well
[[ -f "$IT/private/lscolors.sh" ]] && source "$IT/private/lscolors.sh"
# I prefer symlinks in a more visible color
export LS_COLORS="${LS_COLORS}:ln=01;38;5;208"

# export EZA_COLORS="ln=01;36"
# Shared between Bash and Zsh (aliases, exports, sources, ...)
# After antidote plugins to overwrite, e.g. aliases, if needed
[[ -f $SCRIPTS/sharedrc ]] && source $SCRIPTS/sharedrc

# Kitty Drag and Drop with fzf (Ctrl-o)
fzf-kitty-dnd-widget() {
  # Pipe directly into fzf so it isn't starved by ZLE
  local selected=$(
    fd --hidden --follow --exclude .git |
      fzf -m --height 40% --layout=reverse --border --prompt='Select files to drag > '
  )

  if [[ -n $selected ]]; then
    zle -I
    kitten dnd --drag-thumbnail /usr/share/icons/Faenza/apps/96/application-x-clementine.png -- "${(@f)selected}"
  fi

  zle reset-prompt
}

zle -N fzf-kitty-dnd-widget
bindkey -M viins '^O' fzf-kitty-dnd-widget

# Needed for Esc. Must be last rebind of keys
bindkey -A viins main

eval "$(oh-my-posh init zsh --config "${DOTS_PATH}/oh-my-posh-themes/light-gruvbox-catppuccin-mocha.omp.toml")"
