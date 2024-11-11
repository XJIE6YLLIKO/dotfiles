{ pkgs, ... }:
# let
#    kvantumThemePackage = pkgs.catppuccin-kvantum.override {
#       accent = "sky";
#       variant = "mocha";
#     };
# in
{
  qt.enable = true;
  qt.platformTheme.name = "kvantum";
  qt.style.name = "kvantum";
  qt.style.catppuccin = {
    flavor = "mocha";
    accent = "sky";
    enable = true;
    apply = true;
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
  ];

  # xdg.configFile = {
  #    "Kvantum/kvantum.kvconfig".text = ''
  #      [General]
  #      theme=Catppuccin-Mocha-sky
  #    '';
  #
  #    # The important bit is here, links the theme directory from the package to a directory under `~/.config`
  #    # where Kvantum should find it.
  #    "Kvantum/Catppuccin-Mocha-sky".source = "${kvantumThemePackage}/share/Kvantum/catppuccin-mocha-teal";
  # };
}
