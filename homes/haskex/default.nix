{inputs, ...}: {
  home = {
    username = "haskex";
    homeDirectory = "/home/haskex";
    stateVersion = "25.05";
  };

  imports = [
    ./terminal
    ./desktop
    ./browsers

    inputs.self.homeManagerModules.all
  ];
}
