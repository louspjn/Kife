{inputs, ...}: {
  imports = [
    ./nushell.nix
    ./git.nix
    ./neovim.nix
    ./nh.nix
    ./reop.nix
    ./tmux.nix
    ./yazi.nix

    inputs.reop.homeManagerModules.reop
    inputs.nvf.homeManagerModules.default
  ];
}
