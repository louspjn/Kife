{inputs, ...}: {
  imports = [
    ./zen.nix

    inputs.zen-browser.homeModules.beta
  ];
}
