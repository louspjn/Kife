{
  imports = [
    ./hardware
    ./locale
    ./user
    ./nixconf.nix
    ./bootloader.nix
  ];

  system.stateVersion = "25.05";
}
