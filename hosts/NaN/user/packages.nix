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
      nitch
      nautilus
      loupe
      blueman
      waypaper
      swww
    ];
  };

  programs = {
    nh.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    hyprland.enable = true;
  };
}
