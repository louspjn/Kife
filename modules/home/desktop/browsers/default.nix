{inputs, ...}: {
  imports = [
    ./zen.nix
    ./vivaldi.nix

    inputs.zen-browser.homeModules.beta
  ];
}
