# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/ricky/.zsh/completions:"* ]]; then export FPATH="/home/ricky/.zsh/completions:$FPATH"; fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source "$HOME/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search )

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$PATH:/home/ricky/.local/bin
export PATH=$PATH:/home/ricky/Applications
export PATH=$PATH:/home/ricky/Applications/flutter/bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:/home/ricky/.pub-cache/bin
export PATH=$PATH:/home/ricky/.spicetify
export PATH="$HOME/.tmuxifier/bin:$PATH"
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
export XDG_DATA_DIRS=$XDG_DATA_DIRS:/home/ricky/.local/share/flatpak/exports/share
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH="$PATH:/home/ricky/.dotnet/tools"
export ATAC_KEY_BINDINGS="$HOME/.config/atac/keybinds.toml"
export ATAC_THEME="$HOME/.config/atac/catppuccin.toml"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path(){
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always --icons=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

export PATH="$PATH:$HOME/Applications"

export CHROME_EXECUTABLE=/usr/bin/zen-browser
export EDITOR='nvim'
export VISUAL='nvim'
eval "$(fzf --zsh)"
export BAT_THEME="Catppuccin Mocha"
alias ls="exa --color=always --icons=always "

alias oldcat=$(which cat)
alias cat="bat"
alias icat="kitten icat"
eval "$(zoxide init zsh)"
alias cd="z"
alias mux="tmuxinator"
alias lg="lazygit"
alias ld="lazydocker"
alias r="ranger"
alias bt="bashtop"
alias sicstus="rlwrap sicstus"
alias adbscreen="adb exec-out screencap -p > screen.png"
alias ze="zellij"
alias uni="zellij -l uni"
alias hpedit="nvim ~/.config/hypr/hyprland.conf"
eval $(thefuck --alias)

[ -f "/home/ricky/.ghcup/env" ] && . "/home/ricky/.ghcup/env" # ghcup-env
. "/home/ricky/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

source ~/.bash_profile
