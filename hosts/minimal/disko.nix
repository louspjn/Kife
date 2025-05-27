{disk ? "/dev/nvme0n1", ...}: let
  part = "/dev/disk/by-partlabel/";
in {
  disko.devices.disk.main = {
    type = "disk";
    device = disk;
    content = {
      type = "gpt";

      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        swap = {
          size = "5G";
          type = "8200";
          content.type = "swap";
        };

        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };

  fileSystems = {
    "/boot" = {
      device = part + "disk-main-ESP";
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
}
