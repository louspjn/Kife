{variables, pkgs, ...}:
{
  env = {
    NH_FLAKE = "/home/lousp/SagittariusOS";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
  };

  packages = with pkgs; [
    libnotify

    unzip
    wget

    home-manager
    blueman
    alsa-utils
    pavucontrol
  ];

  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  desktop = {
    windowManager.hyprland.enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  bootloader.grub = {
    enable = true;
    efiSupport = true;
    background = builtins.toPath "${variables.assets.wallpapers}/solarsystem.jpg";
  };

  sound.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
