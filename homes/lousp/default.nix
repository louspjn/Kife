{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "lousp";
    homeDirectory = "/home/lousp";
    stateVersion = "25.11";

    packages = with pkgs; [
      mpv
      cava
      nautilus
      loupe
      devenv
    ];
  };

  imports = [
    ./terminal.nix
    ./desktop.nix
    ./helix.nix

    inputs.self.homeModules.all
    inputs.spicetify.homeManagerModules.default
  ];
}
