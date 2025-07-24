{inputs, global, ...}: {
  flake = {
    inherit inputs;

    imports = [
      (import ../hosts {inherit inputs global;})
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
