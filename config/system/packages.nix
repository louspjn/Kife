{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    home-manager
    nodejs
    unzip
    sqlite
    obsidian

    upower
    bluez
    libnotify
    brightnessctl
    lm_sensors
    pulseaudio
  ];

  programs = {
    nh.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    hyprland.enable = true;
  };
}
