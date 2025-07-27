{
  pkgs,
  ...
}:
{
  home = {
    username = "lousp";
    homeDirectory = "/home/lousp";
    stateVersion = "25.11";

    packages = with pkgs; [
      mpv
      cava
      nautilus
      loupe
      equibop
      microfetch
      swww
      waypaper
      nh
      niriswitcher
      dmenu

      (import ./coffee { inherit pkgs; })
    ];
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./firefox.nix
    ./helix.nix
    ./terminal.nix
  ];

  programs = {
    spicetify.enable = true;

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

  services.dunst = {
    enable = true;
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
      helix.enable = false;
      firefox.profileNames = [ "default" ];
    };
  };

  gtk.iconTheme = {
    name = "gruvbox-dark-icons-gtk";
    package = pkgs.gruvbox-dark-icons-gtk;
  };
}
