self: super: {
  nitch = super.callPackage ./nitch/package.nix {};
  wallpapers = super.callPackage ./wallpapers/package.nix {};
}
