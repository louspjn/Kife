{ inputs, ... }: let
  dotfiles = "/home/lousp/Kife/dotfiles";
in {
  perSystem = { pkgs, system, ... }: let
    mkConfigWrapper = package: flag: conf: inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.${package};
      flags.${flag} = "${dotfiles}/${conf}";
    };
  in {
    packages = {
      zellij = mkConfigWrapper "zellij" "--config-dir" "zellij";
      dunst = mkConfigWrapper "dunst" "-conf" "dunst/dunstrc";
      niri = mkConfigWrapper "niri" "-c" "niri/config.kdl";
      hyprlock = mkConfigWrapper "hyprlock" "-c" "hypr/hyprlock.conf";
      # hypridle = mkConfigWrapper "hypridle" "-c" "hypr/hypridle.conf";
    };
  };
}
