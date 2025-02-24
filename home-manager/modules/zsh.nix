{ config, pkgs, ... }:

{
  home.file.".zshrc".source = ./dotfiles/.zshrc;
}
