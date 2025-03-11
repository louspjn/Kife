{ config, pkgs, ... }:

{
  home.file.".config/fish/config.fish".text = "
    if status is-interactive
      
      set fish_greeting

      nitch
      zoxide init fish | source

      # Alias
      alias cd='z'
      alias cat='bat'
      alias nvim='nix run ~/.config/system/Flakes/nvim/'
      alias hw='home-manager switch --flake ~/.config/system/home-manager'
      alias nw='sudo nixos-rebuild switch --flake ~/.config/system/nixos'
      alias sysconf='cd ~/.config/system/; nvim'
      alias devshell='nix develop --impure ~/.config/system/DevShell'
      
      # Ls
      alias ls='exa'
      alias l='exa --tree'
      alias lt='exa -all --long'
      alias ll='l --tree'

      # Variaveis
      set -x NIXPKGS_ALLOW_UNFREE 1
    end
  ";
}
