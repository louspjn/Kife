{
  inputs,
  pkgs,
  lib,
}:
let
  password = "$6$B8TcNHoEr3/vwaoT$jbmb4VotLlY8VAie4SX6xonEQxW9DPi0BQTjcNVNOW0F21qlB0xgVwx7I1rGTtQqOYAeSD/A9G0Gjd4VLAlEQ1";
in
{
  name,
  system ? "x86_64-linux",
  modules ? [ ],
  locale ? "pt_BR.UTF-8",
  keyboard ? {
    layout = "br";
    variant = "abnt2";
  },
  user ? {
    name = "lousp";
    shell = pkgs.nushell;
    root = false;
    password = password;
    description = "Jhuan Nycolas";
  },
}:
let
  wheel = lib.mkIf (!user.root) "wheel";
in
lib.nixosSystem {
  inherit system;
  modules = modules ++ [
    {
      users.users.${user.name} = {
        isNormalUser = !user.root;
        hashedPassword = user.password;
        description = user.description;
        shell = user.shell;
        extraGroups = [
          "networkmanager"
          wheel
        ]
        ++ user.groups or [ ];
      };

      time.timeZone = "America/Sao_Paulo";
      i18n.defaultLocale = locale;

      services.xserver = {
        enable = true;

        xkb = {
          layout = keyboard.layout;
          variant = keyboard.variant;
        };
      };

      console.useXkbConfig = true;

      networking = {
        hostName = name;
        networkmanager.enable = true;
      };

      nix.settings.experimental-features = "nix-command flakes";
      system.stateVersion = "25.05";
    }
  ];
}
