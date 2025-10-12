{ pkgs, ... }: {
  hjem.users.lousp = {
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

      helix
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

      zellij
      ghostty
      git
    ];

    systemd.services = {
      dunst.enable = true;
      hypridle.enable = true;
    };
  };
}
