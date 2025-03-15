{
  programs = {
    nh.enable = true;
    neovim.enable = true;
  };

  imports = [
    ./bootloader.nix
    ./packages.nix
    ./networking.nix
    ./locale.nix
    ./sound.nix
    ./users.nix
    ./system.nix
  ];

  system.stateVersion = "25.05";
}
