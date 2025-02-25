{ config, pkgs, ... }:

{
  gtk.enable = true;

  gtk.cursorTheme.package = pkgs.rose-pine-cursor;
  gtk.cursorTheme.name = "Rosé Pine";
}
