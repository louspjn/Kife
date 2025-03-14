let
  wallpaper = "../../dotfiles/wallpaper-nord.jpg";
in
{
  programs.hyprpaper.enable = true;

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = , ${wallpaper}
  '';
}
