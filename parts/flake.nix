{inputs, ...}: {
  flake = {
    inherit inputs;

    imports = [
      ../hosts
    ];

    homeModules.default = ../modules/home;
    nixosModule.default = ../modules/system;

    templates = {
      haskell = {
        path = ../templates/Haskell;
        description = "Haskell Simple Template";
      };
    };
  };
}
