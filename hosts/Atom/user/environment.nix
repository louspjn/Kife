{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
