{pkgs, ...}: {
  np = {
    defaultPackages = true;

    overlays = {
      enable = true;

      paths = [
        ../../../../parts/extraPackages
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
