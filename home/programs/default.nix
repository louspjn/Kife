{inputs, ...}: {
  imports = [
    ./modules/albert.nix
    ./modules/kitty.nix
    ./modules/zenBrowser.nix

    inputs.zen-browser.homeModules.beta
  ];
}
