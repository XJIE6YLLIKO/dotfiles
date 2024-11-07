{ pkgs, config, system, inputs,... }: 
{
  # specialArgs = { inherit system; inherit inputs; };

  programs.steam = {
    enable = true;
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };

  hardware.opentabletdriver.enable = true;
  time.hardwareClockInLocalTime = true;

  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];
  
  services = {    
    thermald.enable = true;
    cpupower-gui.enable = true;
    # power-profiles-daemon.enable = true;
    # fprintd.enable = true;
    # fprintd.package = pkgs.fprintd-tod;
    # fprintd.tod.enable = true;
    # fprintd.tod.driver = pkgs.libfprint-2-tod1-elan;
 
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "auto";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };

  # powerManagement.cpuFreqGovernor = "performance";

  boot = {
    kernelModules = ["acpi_call"];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
      ]
      ++ [pkgs.cpupower-gui];
  };
  home-manager.backupFileExtension = "backup3";
}
