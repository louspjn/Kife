self: super: {
  nitch = super.callPackage ./nitch/package.nix {};

  vivaldi = super.callPackage ./vivaldi.nix;
}
