{pkgs, ...}: {
  imports = [
    ./apps
  ];

  terminal = {
    emulators.kitty = {
      enable = true;
      useDefaultConfig = true;
    };

    shells.nushell = {
      enable = true;

      useDefaultConfig = true;

      aliases = {
        cat = "${pkgs.bat}/bin/bat";

        nixos = "nh os";
        nps = "nh search";
        ncn = "nh clean";

        l = "ls **/*";

        cd = "z";
      };

      extraConfig = "nitch";

      zoxide = {
        enable = true;
      };

      oh-my-posh.enable = true;
    };

    apps = {
      editors.neovim = {
        enable = true;

        nvf = {
          enable = true;

          settings = import ./apps/neovim.nix;
        };
      };

      git.enable = true;

      nh = {
        enable = true;
        flake = "/home/haskex/nan";
      };
    };
  };
}
