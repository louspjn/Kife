{ config, pkgs, ... }:

{
  # Enable kde plasma.
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      
      xkb = {
        layout = "br";
        variant = "";
      };
    };
    
    desktopManager.plasma6.enable = true;
  };
}
