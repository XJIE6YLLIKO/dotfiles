{ ... }: 
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {};
  security.polkit.enable = true;
}
