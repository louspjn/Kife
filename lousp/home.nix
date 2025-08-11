{ pkgs, ... }:
{
  home = {
    username = "lousp";
    homeDirectory = "/home/lousp";
    stateVersion = "25.11";

    packages = with pkgs; [
      discord
      microfetch
      swww
      waypaper
      nh

      nautilus
      loupe

      zed-editor
      gcc
      rust-analyzer
      typescript-language-server
      nil
      alejandra
    ];
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./firefox.nix
    ./helix.nix
    ./terminal.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  programs = {
    spicetify.enable = true;

    wofi = {
      enable = true;
    };

    alacritty = {
      enable = true;

      settings = {
        window = {
          padding = {
            x = 14;
            y = 14;
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
      firefox.profileNames = [ "default" ];
    };
  };
}
