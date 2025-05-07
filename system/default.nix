{
  imports = [
    ./modules/hardware
    ./modules/locale
    ./modules/user
    ./modules/nixconf.nix
    ./modules/bootloader.nix
  ];

  system.stateVersion = "25.05";
}
