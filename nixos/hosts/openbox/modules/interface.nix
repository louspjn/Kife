{ config, pkgs, ... }:

{
  # Enable OpenBox.
  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    windowManager.openbox.enable = true;

    xkb = {
      layout = "br";
      variant = "abnt2";
    };
  };
}
