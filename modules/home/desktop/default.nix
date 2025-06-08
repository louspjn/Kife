{inputs, ...}: {
  imports = [
    ./browsers
    ./windowManagers.nix
    ./stylix.nix
    ./discord.nix

    inputs.stylix.homeModules.stylix
  ];
}
