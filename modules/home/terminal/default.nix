{inputs, ...}: {
  imports = [
    ./nushell.nix
    ./kitty.nix
    ./tmux.nix
    ./yazi.nix
    ./neovim.nix
    ./git.nix
    ./helix.nix
    ./nh.nix
    ./fetch.nix

    inputs.nvf.homeManagerModules.default
  ];
}
