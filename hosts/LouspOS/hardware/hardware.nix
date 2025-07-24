{
  config,
  lib,
  modulesPath,
  ...
}:
let
  redistributableFirmware = config.hardware.enableRedistributableFirmware;
  part = "/dev/disk/by-partlabel/";
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  fileSystems = {
    "/boot" = {
      device = part + "disk-main-boot";
      fsType = "vfat";
    };

    "/" = {
      device = part + "disk-main-root";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {
      device = part + "disk-main-swap";
    }
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "xhci_pci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };

    kernelModules = [ "kvm-intel" ];
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault redistributableFirmware;
    graphics.enable = true;
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
