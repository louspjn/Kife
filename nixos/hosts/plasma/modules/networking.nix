{ config, pkgs, ... }:

{
  networking = {
    hostName = "Jhuan";

    networkmanager.enable = true;
  };
}
