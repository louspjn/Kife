{inputs, ...}: {
  imports = [
    ./nushell.nix
    ./kitty.nix
    ./zellij.nix
    ./tmux.nix
    ./yazi.nix
    ./neovim.nix
    ./alacritty.nix
    ./git.nix
    ./nh.nix
    ./fetch.nix

    inputs.nvf.homeManagerModules.default
  ];
}
