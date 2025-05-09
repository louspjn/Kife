{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    users.haskex = ../../../../home;

    extraSpecialArgs = {
      inherit pkgs inputs;
    };
  };
}
