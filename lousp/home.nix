{pkgs, ...}: {
  home = {
    username = "lousp";
    homeDirectory = "/home/lousp";
    stateVersion = "25.11";

    packages = with pkgs; [
      equibop
      microfetch
      swww
      waypaper
      nh
      xfce.thunar

      rust-analyzer
      rustfmt
      nil
      alejandra
      clang-tools
    ];
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./firefox.nix
    ./helix.nix
    ./terminal.nix
    ./hyprland.nix
  ];

  programs = {
    spicetify.enable = true;

    wofi = {
      enable = true;
    };

    kitty = {
      enable = true;

      settings = {
        cursor_trail = 4;
        cursor_trail_start_threshold = 0;

        window_padding_width = 10;
      };
    };

    git = {
      enable = true;

      userName = "louspjn";
      userEmail = "nycojn@gmail.com";
      extraConfig = {
        credential.helper = "store";
        init.defaultBranch = "main";
      };
    };
  };

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };

      sizes = {
        terminal = 11;
        desktop = 10;
        applications = 11;
      };
    };

    targets = {
      nvf.enable = false;
      firefox.profileNames = ["default"];
    };
  };

  gtk.iconTheme = {
    name = "gruvbox-dark-icons-gtk";
    package = pkgs.gruvbox-dark-icons-gtk;
  };
}
