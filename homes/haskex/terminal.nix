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
      flake = "/home/haskex/Haskex";
    };

    git.enable = true;

    fetch.microfetch.enable = true;

    multiplexers.tmux.enable = true;

    file-managers.yazi.enable = true;
  };
}
