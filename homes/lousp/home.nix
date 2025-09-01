{pkgs, ...}: {
  home.packages = with pkgs; [
    nh

    nautilus
    discord
    loupe
    hyprlock

    gcc
    cargo
    cargo-watch
    nodejs
    lua
    haskellPackages.ghc
    haskellPackages.stack
    (python3.withPackages (ps: with ps; [
      watchdog
    ]))

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
    fastfetch
    yazi
    zellij

    swww
    waypaper
    wl-clipboard
    matugen

    bibata-cursors
    papirus-icon-theme
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
    rofi
    # alacritty
    # ghostty
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./firefox.nix
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  services.hypridle.enable = true;
  programs.git = {
    enable = true;

    userName = "louspjn";
    userEmail = "nycojn@gmail.com";
    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
    };
  };
}
