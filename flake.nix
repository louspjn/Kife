{
  description = "LouspOS Configuration";

  outputs = inputs:
    inputs.parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./parts
      ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    rpc.url = "github:ndom91/rose-pine-hyprcursor";

    parts.url = "github:hercules-ci/flake-parts";
    spicetify.url = "github:Gerg-L/spicetify-nix";

    nvf.url = "github:notashelf/nvf";

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
