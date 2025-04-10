{
  programs = {
    neovim.enable = true;
  };

  imports = [
    ../default/bootloader.nix
    ./modules/packages.nix
    ./modules/interface.nix
    ./modules/network.nix
    ../default/locale.nix
    ../default/sound.nix
    ../default/users.nix
    ../default/system.nix
    ../hardware-configuration.nix
  ];

  system.stateVersion = "25.05";
}
