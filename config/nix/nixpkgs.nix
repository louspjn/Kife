{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };

    overlays = [
      (self: super: {
        nitch = super.callPackage ../pkgs/nitch/package.nix {};
      })
    ];
  };
}
