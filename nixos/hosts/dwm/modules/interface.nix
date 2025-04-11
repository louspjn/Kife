{
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "br";
        variant = "abnt2";
      };

      windowManager.dwm.enable = true;
    };
  };
}
