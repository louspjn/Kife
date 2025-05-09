let
  usernm = "haskex";
in {
  home = {
    username = usernm;
    homeDirectory = "/home/${usernm}";
    stateVersion = "25.05";
  };

  imports = [
    ./programs
    ./terminal
    ./hyprland
    ./ui
  ];
}
