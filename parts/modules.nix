{
  flake = let
    modules = ../modules;
  in {
    homeModules = let
      hmModules = modules + /home;
    in {
      all = import hmModules;

      terminal = import hmModules + /terminal;
      desktop = import hmModules + /desktop;
    };

    nixosModules = let
      osModules = modules + /system;
    in {
      all = import osModules;

      nixpkgs = import osModules + /nixpkgs;
    };
  };
}
