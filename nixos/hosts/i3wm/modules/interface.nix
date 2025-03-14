{
  # Enable I3-wm.
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    displayManager.gdm.enable = true;

    xkb = {
      layout = "br";
      variant = "abnt2";
    };

    windowManager.i3.enable = true;
  };
}
