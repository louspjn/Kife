{inputs, ...}: {
  imports = [
    ./modules/nushell.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/nh.nix
    ./modules/reop.nix
    ./modules/tmux.nix
    ./modules/yazi.nix

    inputs.reop.homeManagerModules.reop
    inputs.nvf.homeManagerModules.default
  ];
}
