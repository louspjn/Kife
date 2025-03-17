{
  imports =
    [
      ../../hardware-configuration.nix
      ./modules/interface.nix
      ./modules/cursor.nix
      ./modules/security.nix
      ../default/config.nix
    ];
}
