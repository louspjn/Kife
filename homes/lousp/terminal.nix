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
      flake = "/home/lousp/LouspOS";
    };

    git.enable = true;

    editors.emacs.enable = true;

    fetch.microfetch.enable = true;

    multiplexers.tmux.enable = true;

    file-managers.yazi.enable = true;
  };
}
