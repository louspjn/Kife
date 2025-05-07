{
  imports = [
    ./modules/hardware-configuration.nix

    ./modules/bootloader.nix
    ./modules/environment.nix
    ./modules/keyboard.nix
    ./modules/locale.nix
    ./modules/nixconf.nix
    ./modules/packages.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/wireless.nix
  ];

  system.stateVersion = "25.05";
}
