{inputs, ...}: {
  home = {
    username = "haskex";
    homeDirectory = "/home/haskex";
    stateVersion = "25.11";
  };

  imports = [
    ./terminal.nix
    ./desktop.nix

    inputs.self.homeModules.all
  ];
}
