{
  terminal = {
    emulators.kitty.enable = true;

    shells.nushell = {
      enable = true;

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
