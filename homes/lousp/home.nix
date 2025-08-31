{pkgs, ...}: {
  home.packages = with pkgs; [
    nh

    nautilus
    discord
    loupe
    hyprlock
    hypridle

    gcc
    cargo
    cargo-watch
    nodejs
    lua
    haskellPackages.ghc
    haskellPackages.stack

    luaPackages.luv
    pywalfox-native

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
    btop

    waybar
    kitty
    # alacritty
    # ghostty
    wofi
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./terminal.nix
    ./firefox.nix
  ];

  programs = {
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
