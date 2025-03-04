{ config, pkgs, ... }:

{
  home.file.".config/fish/config.fish".text = "
    if status is-interactive
      
      set fish_greeting
      
      echo
      nitch
      zoxide init fish | source

      # Alias
      alias cd='z'
      alias cat='bat'
      alias ficg='nvim ~/.config/system-config/home-manager/modules/fish.nix'
      
      # Ls
      alias ls='exa'
      alias l='exa --tree'
      alias lt='exa -all --long'
      alias ll='l --tree'
    end
  ";
}
