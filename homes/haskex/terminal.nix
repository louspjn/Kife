{pkgs, ...}: {
  terminal = {
    emulators.kitty.enable = true;

    shells.nushell = {
      enable = true;

      useDefaultConfig = true;

      aliases = {
        cat = "${pkgs.bat}/bin/bat";

        nixos = "nh os";
        nps = "nh search";
        ncn = "nh clean";

        recorder = "${pkgs.wf-recorder}/bin/wf-recorder";

        l = "ls **/*";

        cd = "z";
      };

      zoxide.enable = true;
      oh-my-posh.enable = true;
    };

    nh = {
      enable = true;
      flake = "/home/haskex/Paradox";
    };

    git.enable = true;

    editors.neovim = {
      enable = true;

      nvf.enable = true;
    };

    multiplexers.tmux = {
      enable = true;
    };

    file-managers.yazi = {
      enable = true;
    };
  };
}
