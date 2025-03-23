{
  services = {
    xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };

      windowManager.qtile = {
        enable = true;
      };

      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
