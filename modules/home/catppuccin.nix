{ pkgs, lib, ... }:
{
  catppuccin.flavor = "mocha";
  catppuccin.accent = "blue";
  catppuccin.enable = true;
  catppuccin = {
    pointerCursor = {
      enable = true;
      accent = "dark";
      flavor = "mocha";
    };
  };

  home.pointerCursor = lib.mkForce {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;  
    gtk.enable = true;
    x11.enable = true;
  };
}
