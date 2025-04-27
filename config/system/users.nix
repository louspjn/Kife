{pkgs, ...}: {
  users.users.haskex = {
    isNormalUser = true;
    description = "Me";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.nushell;
  };
}
