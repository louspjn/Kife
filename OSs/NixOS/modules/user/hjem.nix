{ pkgs, inputs, ... }: let
  selfpkgs = inputs.self.packages.x86_64-linux;
in {
  hjem.users.lousp = {
    imports = [./dotfiles.nix];
    
    packages = with pkgs; [
      nh

      discord
      hypridle
      nwg-look
      hyprlock
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
      libadwaita
      nerd-fonts.jetbrains-mono

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

      xwayland-satellite
      firefox

      helix
      ghostty
      git

    ] ++ (with selfpkgs; [
      zellij-wrapped
    ]);

    systemd.services = {
      dunst.enable = true;
      hypridle.enable = true;
    };
  };
}
