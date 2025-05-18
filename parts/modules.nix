let
  modules = ../modules;
in {
  homeModules = let
    hmModules = modules + /home;
  in {
    all = import hmModules;

    terminal = import hmModules + /terminal;
  };
}
