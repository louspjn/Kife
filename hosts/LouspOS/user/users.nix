{
  pkgs,
  inputs,
  homes,
  ...
}: {
  users.users.lousp = {
    isNormalUser = true;
    hashedPassword = "$6$B8TcNHoEr3/vwaoT$jbmb4VotLlY8VAie4SX6xonEQxW9DPi0BQTjcNVNOW0F21qlB0xgVwx7I1rGTtQqOYAeSD/A9G0Gjd4VLAlEQ1";
    description = "Jhuan Nycolas";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.nushell;
  };

  home-manager = {
    users.lousp = homes.lousp;

    extraSpecialArgs = {
      inherit pkgs inputs;
    };

    backupFileExtension = "backup";
  };
}
