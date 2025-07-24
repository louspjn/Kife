{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.rpc.packages.${pkgs.system}.default
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };
}
