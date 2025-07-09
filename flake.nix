{
  description = "LouspOS Configuration";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        (import ./parts {inherit inputs;})
      ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    hyprscripts.url = "github:hyprwm/contrib";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-cli.url = "github:nix-community/nixos-cli";

    disko.url = "github:nix-community/disko";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
