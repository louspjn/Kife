{
  config,
  lib,
  modulesPath,
  inputs,
  ...
}: let
  redistributableFirmware = config.hardware.enableRedistributableFirmware;
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disko.nix

    inputs.disko.nixosModules.disko
  ];

  boot = {
    initrd = {
      availableKernelModules = ["ahci" "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };

    kernelModules = ["kvm-intel"];
    extraModulePackages = [];
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault redistributableFirmware;
    graphics.enable = true;
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
