{inputs, ...}: {
  home = {
    username = "haskex";
    homeDirectory = "/home/haskex";
    stateVersion = "25.05";
  };

  modules = [
    inputs.self.homeModules.all
  ];

  imports = [
    ./terminal.nix
    ./desktop.nix
  ];
}
