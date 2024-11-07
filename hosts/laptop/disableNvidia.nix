{ pkgs, config, ... }:
{
  options.disableNvidia.isNvidiaOn = pkgs.lib.mkOption {
    default = false;
    type = with pkgs.lib.types; bool;
  };

  config = {
    boot.extraModprobeConfig = pkgs.lib.mkIf (!config.disableNvidia.isNvidiaOn) ''
      blacklist nouveau
      options nouveau modeset=0
    '';

    services.udev.extraRules = pkgs.lib.mkIf (!config.disableNvidia.isNvidiaOn) ''
      # Remove NVIDIA USB xHCI Host Controller devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA USB Type-C UCSI devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA Audio devices, if present
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
      # Remove NVIDIA VGA/3D controller devices
      ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
    '';
    boot.blacklistedKernelModules = pkgs.lib.mkIf (!config.disableNvidia.isNvidiaOn) [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  };
}
