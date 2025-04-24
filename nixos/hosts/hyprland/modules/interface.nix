{pkgs, ...}: {
  services = {
    displayManager.sddm = {
      enable = true;

      package = pkgs.kdePackages.sddm;

      extraPackages = [pkgs.sddm-astronaut];
      theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };
  };

  programs.hyprland.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
