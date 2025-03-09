{ config, pkgs, ... }:

{
  networking = {
    hostName = "Jhuan's PC";
    
    networkmanager.enable = true;
  };
}
