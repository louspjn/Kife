{ config, pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
