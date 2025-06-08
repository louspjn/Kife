{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "haskex";
    homeDirectory = "/home/haskex";
    stateVersion = "25.11";

    packages = with pkgs; [
      mpv
      cava
      nautilus
      loupe
    ];
  };

  imports = [
    ./terminal.nix
    ./desktop.nix

    inputs.self.homeModules.all
  ];
}
