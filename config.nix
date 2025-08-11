{pkgs, ...}: let
  locale = "pt_BR.UTF-8";
in {
  imports = [
    ./hardware.nix
  ];

  users.users.lousp = {
    isNormalUser = true;
    hashedPassword = "$6$B8TcNHoEr3/vwaoT$jbmb4VotLlY8VAie4SX6xonEQxW9DPi0BQTjcNVNOW0F21qlB0xgVwx7I1rGTtQqOYAeSD/A9G0Gjd4VLAlEQ1";
    description = "Jhuan Nycolas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  environment = {
    sessionVariables = {
      NH_FLAKE = "/home/lousp/SagittariusOS";
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXOS_OZONE_WL = "1";
      EDITOR = "zeditor";
    };

    systemPackages = with pkgs; [
      libnotify

      unzip
      wget

      home-manager
      blueman
      alsa-utils
      pavucontrol
    ];
  };

  programs.hyprland.enable = true;

  boot = {
    loader = {
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        timeoutStyle = "hidden";
        splashImage = ./assets/wallpapers/solarsystem.jpg;
      };

      efi.canTouchEfiVariables = true;
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };

  time.timeZone = "America/Sao_Paulo";
  i18n = {
    defaultLocale = "${locale}";

    extraLocaleSettings = {
      LC_ADDRESS = "${locale}";
      LC_IDENTIFICATION = "${locale}";
      LC_MEASUREMENT = "${locale}";
      LC_MONETARY = "${locale}";
      LC_NAME = "${locale}";
      LC_NUMERIC = "${locale}";
      LC_PAPER = "${locale}";
      LC_TELEPHONE = "${locale}";
      LC_TIME = "${locale}";
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;

      xkb = {
        layout = "br";
        variant = "abnt2";
      };
    };

    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm.overrideAttrs (old: {
        buildInputs =
          (old.buildInputs)
          ++ [
            pkgs.qt6.qtmultimedia
          ];
      });

      theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  networking = {
    hostName = "SagittariusOS";
    networkmanager.enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = "25.05";
}
