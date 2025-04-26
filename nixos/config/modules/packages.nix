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
}
