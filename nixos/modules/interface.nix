{ config, pkgs, ... }:

{
  # Enable kde plasma.
  # services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Enable OpenBox.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.openbox.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };
}
