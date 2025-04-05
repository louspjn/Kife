{
  # Enable kde plasma.
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;

      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };

    desktopManager.plasma6.enable = true;
  };
}
