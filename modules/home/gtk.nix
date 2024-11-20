{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.nerdfonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Noto" ]; })
    pkgs.twemoji-color-font
    pkgs.noto-fonts-emoji
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };

    catppuccin = {
      enable = true;
      accent = "blue";
      flavor = "mocha";
    };
    #
    # theme = {
    #   name = "Dracula";
    #   package = pkgs.dracula-theme;
    # };
    # cursorTheme = {
    #   name = "catppuccin-mocha-dark-cursors";
    #   package = pkgs.catppuccin-cursors.mochaDark;
    #   size = 24;
    # };
  };
  
}
