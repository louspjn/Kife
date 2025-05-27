{
  terminal = {
    emulators.kitty.enable = true;

    shells.nushell = {
      enable = true;

      zoxide.enable = true;
      oh-my-posh.enable = true;
    };

    nh = {
      enable = false;
      flake = "/home/haskex/Quantum";
    };

    git.enable = true;

    fetch.microfetch.enable = true;

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
