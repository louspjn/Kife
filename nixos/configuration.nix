{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bootloader.nix
      ./modules/networking.nix
      ./modules/locale.nix
      ./modules/interface.nix
      ./modules/sound.nix
      ./modules/users.nix
      ./modules/packages.nix
      ./modules/system.nix
    ];

  system.stateVersion = "24.11";
}
