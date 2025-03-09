{ config, pkgs, ... }:

{
  imports =
    [
      ../../hardware-configuration.nix
      ./modules/interface.nix
      ./modules/packages.nix
      ../default/bootloader.nix
      ../default/networking.nix
      ../default/locale.nix
      ../default/sound.nix
      ../default/users.nix
      ../default/system.nix
    ];

  system.stateVersion = "25.11";
}
