{
  pkgs,
  inputs,
  homes,
  ...
}: {
  users.users.haskex = {
    isNormalUser = true;
    hashedPassword = "$6$B8TcNHoEr3/vwaoT$jbmb4VotLlY8VAie4SX6xonEQxW9DPi0BQTjcNVNOW0F21qlB0xgVwx7I1rGTtQqOYAeSD/A9G0Gjd4VLAlEQ1";
    description = "Jhuan Nycolas";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.nushell;
  };

  home-manager = {
    users.haskex = homes.haskex;

    extraSpecialArgs = let
      args = [pkgs inputs];
    in {
      inherit args;
    };
  };
}
