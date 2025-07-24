{inputs, ...}: {
  imports = [
    ./sddm.nix
    # ./nixoscli.nix

    # inputs.nixos-cli.nixosModules.nixos-cli
  ];

  services.flatpak.enable = true;
}
