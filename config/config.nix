{
  imports = [
    ./system/bootloader.nix
    ./system/packages.nix
    ./system/wireless.nix
    ./system/locale.nix
    ./system/sound.nix
    ./system/users.nix
    ./system/nixconf.nix
    ./system/keyboard.nix
    ./system/services.nix
    ./system/environment.nix
    ../hardware-configuration.nix
  ];

  system.stateVersion = "25.05";
}
