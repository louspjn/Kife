self: super: {
  nitch = super.callPackage ./nitch/package.nix {};
  myWallpapers = super.callPackage ./wallpapers/package.nix {};
}
