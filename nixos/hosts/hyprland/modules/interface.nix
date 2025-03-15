{ pkgs, inputs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      
      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };
  };

  programs = {
    hyprland.enable = true;
    waybar.enable = true;
    kitty.enable = true;

    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
