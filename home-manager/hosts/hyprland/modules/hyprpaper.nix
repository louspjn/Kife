let
  wallpaper = "../../dotfiles/wallpaper-nord.jpg";
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = , ${wallpaper}
  '';
}
