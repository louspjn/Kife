{inputs, ...}: {
  imports = [
    ./browsers
    ./windowManagers.nix
    ./style.nix

    inputs.stylix.homeModules.stylix
    inputs.zen-browser.homeModules.beta
  ];
}
