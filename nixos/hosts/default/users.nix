{pkgs, ...}: {
  programs.fish.enable = true;

  users.users.tux = {
    isNormalUser = true;
    description = "Tux";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.fish;
  };
}
