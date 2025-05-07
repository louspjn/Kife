{pkgs, ...}: {
  home.packages = [
    pkgs.papirus-icon-theme
  ];

  gtk.iconTheme = {
    name = "Papirus";
    package = pkgs.papirus-icon-theme;
  };
}
