{inputs, ...}: {
  home = {
    username = "haskex";
    homeDirectory = "/home/haskex";
    stateVersion = "25.05";
  };

  imports = [
    ./terminal.nix
    ./desktop.nix

    inputs.self.homeModules.all
  ];
}
