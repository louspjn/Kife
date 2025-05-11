let
  modules = ../modules;
in {
  homeManagerModules = let
    hmModules = modules + /home;
  in {
    all = import hmModules;

    terminal = import hmModules + /terminal;
  };
}
