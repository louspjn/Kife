{pkgs, ...}: {
  home.packages = with pkgs; [
    nh

    nautilus
    discord
    loupe

    gcc
    cargo
    cargo-watch
    nodejs
    lua
    haskellPackages.ghc
    haskellPackages.stack

    luaPackages.luv

    rust-analyzer
    typescript-language-server
    nil
    alejandra
    rustfmt
    eslint
    lua-language-server
    haskellPackages.haskell-language-server
    grimblast

    neovim
    zoxide
    starship

    swww
    waypaper
    wl-clipboard
    matugen

    papirus-icon-theme
    bibata-cursors
    nerd-fonts.jetbrains-mono

    bat
    cava
    cbonsai
    cmatrix
    eza
    less
    pipes
    wf-recorder

    waybar
    kitty
    wofi
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./terminal.nix
    ./firefox.nix
    ./helix.nix
  ];

  programs = {
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
}
