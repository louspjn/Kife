{ config, pkgs, ... }:

{
  networking.hostName = "Jhuan";

  # Enable networking
  networking.networkmanager.enable = true;
}
