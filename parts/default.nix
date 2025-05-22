{inputs, ...}: {
  imports = [
    ./modules.nix
  ];

  flake.imports = [
    (import ../hosts {inherit inputs;})
  ];
}
