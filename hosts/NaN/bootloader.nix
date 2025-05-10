{
  boot.loader = {
    grub.enable = true;
    grub.devices = ["nodev"];
    grub.efiSupport = true;

    efi.canTouchEfiVariables = true;
  };
}
