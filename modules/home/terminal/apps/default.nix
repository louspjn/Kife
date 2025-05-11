{inputs, ...}: {
  imports = [
    ./editors
    ./git.nix
    ./nh.nix

    inputs.nvf.homeManagerModules.default
  ];
}
