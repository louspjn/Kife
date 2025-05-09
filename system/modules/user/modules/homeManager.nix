{
  pkgs,
  inputs,
  ...
}: {
  home-manager = {
    users.haskex = ../../../../home;

    extraSpecialArgs = {
      inherit pkgs inputs;
    };
  };
}
