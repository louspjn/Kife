{
  inputs,
  pkgs,
  lib,
}: let
  password = "$6$B8TcNHoEr3/vwaoT$jbmb4VotLlY8VAie4SX6xonEQxW9DPi0BQTjcNVNOW0F21qlB0xgVwx7I1rGTtQqOYAeSD/A9G0Gjd4VLAlEQ1";
in
  {
    name,
    system ? "x86_64-linux",
    modules ? [],
    user ? {
      name = "lousp";
      shell = pkgs.nushell;
      root = false;
      password = password;
      description = "Jhuan Nycolas";
    },
    profile ? "desktop",
    variables ? {},
  }: let
    wheel = lib.mkIf (!user.root) "wheel";
  in
    lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit variables;
      };

      modules =
        modules
        ++ [
          (import ./${profile}.nix {
            inherit
              name
              user
              wheel
              ;
          })

          ../hosts/${name}/config.nix
          ../hosts/${name}/hardware.nix
        ];
    }
