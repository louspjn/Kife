{inputs, ...}: {
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./stylix.nix

    inputs.stylix.homeManagerModules.stylix
  ];
}
