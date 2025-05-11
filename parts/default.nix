{inputs, ...}: {
  imports = [
    (import ../hosts {inherit inputs;})

    ./modules.nix
  ];
}
