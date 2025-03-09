{ config, pkgs, ... }:

{
  # Enable I3-wm.
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.gdm.enable = true;

    xkb = {
      layout = "br";
      variant = "";
    };

    windowManager.qtile.enable = true;
  };
}
