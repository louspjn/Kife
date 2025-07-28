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
      nh
      dmenu

      (st.overrideAttrs (old: {
        src = ./coffee;
        patches = [
          (pkgs.fetchpatch {
            url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
            hash = "sha256-W1qMGJRcfvmLp9hXzISIGo6XAk/Q88oaYoMD6kAEdks=";
          })
          (pkgs.fetchpatch {
            url = "https://st.suckless.org/patches/ligatures/0.9.2/st-ligatures-20241226-0.9.2.diff";
            hash = "sha256-LC4KOVY7rE9wqLi0ta++cLMj8WZkDByl2UMa7z2X5tQ=";
          })
          (pkgs.fetchpatch {
            url = "https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.5.diff";
            hash = "sha256-BGRSYG/Otiq8jwaNiRxaXqPY0rinE9BTtWj5cQAYEIE=";
          })
        ];

        buildInputs = (old.buildInputs or []) ++ [
          pkgs.harfbuzz
        ];
      }))
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
