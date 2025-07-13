{inputs, pkgs, ...}: {
  desktop = {
    windowManagers = {
      hyprland.enable = true;
      lockscreen.hyprlock.enable = true;

      statusbar.waybar.enable = true;
      wallpaper.waypaper.enable = true;
    };

    browsers.zen.enable = true;

    stylix.enable = true;

    apps = {
      discord = {
        enable = true;
        equibop = true;
      };
    };

    menus.rofi.enable = true;
  };

  programs.spicetify = let
    spotifyPkgs = inputs.spicetify.legacyPackages.${pkgs.system};
  in {
    enable = true;
  };
}
