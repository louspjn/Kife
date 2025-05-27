{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services.xserver.xkb.layout = "us";

  users.users.haskex = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    packages = with pkgs; [
      neovim
      git
    ];
  };

  system = {
    copySystemConfiguration = true;
    stateVersion = "25.05";
  };
}
