{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = ["ntfs"];
  # boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.device = "/dev/nvme0n1";
  # boot.loader.grub2-theme = {
    # enable = true;
    # theme = "stylish";
    # footer = true;
  # };
}
