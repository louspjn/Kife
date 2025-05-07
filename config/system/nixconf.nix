{
  nixpkgs = {
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
      allowUnfreePredicate = _: true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };
}
