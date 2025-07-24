{inputs, config, global, ...}: {
  flake = {
    inherit inputs;

    imports = [
      (import ../hosts {inherit config global;})
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
