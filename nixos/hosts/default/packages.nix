{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    home-manager
    nodejs
    unzip
    sqlite
    obsidian
  ];
}
