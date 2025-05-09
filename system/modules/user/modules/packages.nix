{pkgs, ...}: {
  np = {
    defaultPackages = true;

    overlays = {
      enable = true;

      paths = [
        ../../../../extraPackages
      ];
    };

    packages = with pkgs; [
      obsidian
      zoxide
      alsa-utils
      nitch
      nautilus
      loupe
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
