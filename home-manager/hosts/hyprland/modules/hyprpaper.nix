let
  wallpaper = "~/.config/system/home-manager/hosts/dotfiles/wallpaper-nord.jpg";
in
{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${wallpaper}
    wallpaper = , ${wallpaper}
  '';
}
