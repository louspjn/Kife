{
  variables,
  pkgs,
  ...
}: {
  env = {
    NH_FLAKE = "/home/lousp/Linux/Yalix";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
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

  environment.localBinInPath = true;

  security.pam.services.hyprlock = {};

  services = {
    flatpak.enable = true;
    upower.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  desktop = {
    windowManager.hyprland.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "${pkgs.sddm-astronaut}/share/sddm/theme";
    };
  };

  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        devices = ["nodev"];
        efiInstallAsRemovable = true;
        splashImage = builtins.toPath "${variables.assets.wallpapers}/solarsystem.jpg";
      };
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  sound.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}
