{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "Rosé Pine cursors";
    size = 16;
  };

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.papirus-nord;
      name = "Papirus Nord";
    };

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 11;
    };
  };
}
