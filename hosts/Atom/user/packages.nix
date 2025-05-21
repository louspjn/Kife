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
      waypaper
      swww
      mpv
    ];
  };

  programs.hyprland.enable = true;
}
