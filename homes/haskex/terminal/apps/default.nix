{inputs, ...}: {
  imports = [
    ./tmux.nix
    ./yazi.nix

    inputs.reop.homeManagerModules.reop
  ];
}
