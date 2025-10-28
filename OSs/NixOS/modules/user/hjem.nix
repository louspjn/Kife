{ pkgs, inputs, ... }: let
  wrappedpkgs = inputs.self.packages.x86_64-linux;
in {
  hjem.users.lousp = {
    imports = [./dotfiles.nix];
    
    packages = with pkgs; [
      nh
      typescript-language-server
      nodejs
      yarn

      lua
      lua-language-server

      vesktop
      nwg-look
      walker

      gcc
      nil
      alejandra
      rustup
      zig
      zls

      zoxide
      starship
      fastfetch

      swww
      wl-clipboard

      bibata-cursors
      papirus-icon-theme
      catppuccin-gtk
      libadwaita

      bat
      cava
      cbonsai
      cmatrix
      ripgrep
      eza
      less
      pipes
      wf-recorder
      btop
      fzf

      firefox

      helix
      neovim
      ghostty
      git
      hypridle

      grimblast

    ] ++ (with wrappedpkgs; [
      zellij
      dunst
      hyprlock
      # hypridle
      waybar
    ]);
  };
}
