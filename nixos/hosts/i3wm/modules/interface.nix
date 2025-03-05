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

    windowManager.i3.enable = true;
  };
}
