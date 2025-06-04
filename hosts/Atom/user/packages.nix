{
  pkgs,
  overlays,
  ...
}: {
  np = {
    defaultPackages = true;

    overlays = {
      enable = true;

      paths = [
        overlays
      ];
    };

    packages = with pkgs; [
      obsidian
      zoxide
      alsa-utils
      nautilus
      loupe
      blueman
      mpv
      cava
    ];
  };

  programs.hyprland.enable = true;
}
