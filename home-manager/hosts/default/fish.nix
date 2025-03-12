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
      alias nvim='nix run github:Jhuan-Nycolas/Nvim'
      alias hw='home-manager switch --flake'
      alias nw='sudo nixos-rebuild switch --flake'
      alias sysconf='cd ~/.config/system/; nvim'
      alias devshell='nix develop'
      
      # Ls
      alias ls='exa --icons'
      alias l='exa --tree --icons'
      alias lt='exa -all --long --icons'
      alias ll='l --tree --icons'

      # Variaveis
      set -x NIXPKGS_ALLOW_UNFREE 1
    end
  ";
}
