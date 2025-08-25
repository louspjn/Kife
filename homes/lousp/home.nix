{pkgs, ...}: {
  home.packages = with pkgs; [
    microfetch
    nh

    nautilus
    loupe

    gcc
    cargo
    cargo-watch
    nodejs
    lua
    haskellPackages.ghc
    haskellPackages.stack

    rust-analyzer
    typescript-language-server
    nil
    alejandra
    rustfmt
    eslint
    lua-language-server
    haskellPackages.haskell-language-server

    neovim

    swww
    waypaper
    wl-clipboard
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./terminal.nix
    ./waybar.nix
    ./firefox.nix
    ./helix.nix
    ./starship.nix
    ./hypr
    # ./neovim.nix
  ];

  programs = {
    wofi = {
      enable = true;
    };

    alacritty = {
      enable = false;

      settings = {
        window = {
          padding = let
            v = 14;
          in {
            x = v;
            y = v;
          };

          dynamic_padding = true;
        };

        cursor = {
          style.blinking = "always";
          unfocused_hollow = false;
        };

        mouse.hide_when_typing = true;

        font.size = 11;
      };
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

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

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

    icons = {
      enable = true;
      dark = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 10;
    };

    targets = {
      helix.enable = false;
      hyprlock.enable = false;
      firefox.profileNames = ["default"];
    };
  };
}
