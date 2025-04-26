{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/bootloader.nix
    ./modules/packages.nix
    ./modules/wireless.nix
    ./modules/locale.nix
    ./modules/sound.nix
    ./modules/users.nix
    ./modules/nixconf.nix
    ./modules/keyboard.nix
    ../hardware-configuration.nix
  ];

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;

      extraPackages = [pkgs.sddm-astronaut];
      theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
    };

    printing.enable = true;
  };

  programs = {
    nh.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    hyprland.enable = true;
  };

  environment = {
    systemPackages = [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.05";
}
