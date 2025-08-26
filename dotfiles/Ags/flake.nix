{
  description = "Alix Desktop Shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ags,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    entry = "app.ts";

    astalPackages = with ags.packages.${system}; [
      io
      astal4
      hyprland
      notifd
      battery
      apps
      powerprofiles
      wireplumber
      network
      tray
      mpris
    ];

    extraPackages =
      astalPackages
      ++ [
        pkgs.libadwaita
        pkgs.libsoup_3
        pkgs.nushell
      ];
  in {
    packages.${system} = {
      notifications = pkgs.stdenv.mkDerivation {
        name = "notifications";
        src = ./notifications/.;

        nativeBuildInputs = with pkgs; [
          wrapGAppsHook
          gobject-introspection
          ags.packages.${system}.default
        ];

        buildInputs = [
          pkgs.libadwaita
          pkgs.libsoup_3
          pkgs.gjs
        ] ++ (with ags.packages.${system}; [
          io
          astal4
          notifd
        ]);

        installPhase = ''
          runHook preInstall

          mkdir -p $out/bin
          mkdir -p $out/share
          cp -r * $out/share
          ags bundle ${entry} $out/bin/notifications -d "SRC='$out/share'"

          runHook postInstall
        '';
      };
    };

    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [
          (ags.packages.${system}.default.override {
            inherit extraPackages;
          })
        ];

        shellHook = "clear;nu;exit";
      };
    };
  };
}
