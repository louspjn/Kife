nitch

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nord-extended/nord"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

alias ls="exa"
alias lt="exa --tree"
alias l="exa -all --long"
alias ll="l --tree"
alias cd="z"
alias cat="bat"
alias home-switch="home-manager switch --flake ~/.config/system-config/home-manager"
alias nixos-switch="sudo nixos-rebuild switch --flake ~/.config/system-config/nixos"
alias home-edit="nvim ~/.config/system-config/home-manager/home.nix"
alias nixos-edit="sudo nvim ~/.config/system-config/nixos/hosts"
alias hw="home-switch"
alias nw="nixos-switch"
alias he="home-edit"
alias ne="nixos-edit"
alias sddm-theme='sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"'
