{pkgs, ...}: let
  wallpaper = "~/nan/assets/images/wallpapers/nixoslogo.png";
in {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = , ${wallpaper}
  '';

  home.packages = [pkgs.hyprpaper];
}
