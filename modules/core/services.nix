{ pkgs, ... }: 
{
  services = {
    printing.enable = true;
    printing.drivers = [ pkgs.gutenprint pkgs.samsung-unified-linux-driver ];
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    blueman.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    keyd = {
      enable = true;
      keyboards = {
        ids = [ "*" ];
        settings = {
          capslock = "overload(control, esc)";
          esc = "capslock";
        };
      };
    };
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
