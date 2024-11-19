{ pkgs, ... }:
{
  catppuccin.flavor = "mocha";
  catppuccin.accent = "sky";
  catppuccin.enable = true;
  catppuccin = {
    pointerCursor = {
      enable = true;
      accent = "sky";
      flavor = "mocha";
    };
  };

  home.pointerCursor = {
    name = "catppuccin-mocha-sky-cursors";
    package = pkgs.catppuccin-cursors.mochaSky;
    size = 24;  
  };
}
