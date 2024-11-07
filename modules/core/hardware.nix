{ pkgs, ... }:
{  
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };
  };
  hardware.enableRedistributableFirmware = true;
}
