{ system, inputs, pkgs, ... }:
{
  stylix = {
    enable = true;
    polarity = "dark";
    # base16Scheme = ./base16-oxocarbon-dark.yaml;
    base16Scheme = {
      slug = "oxocarbon-dark";
      name = "Oxocarbon Dark";
      author = "shaunsingh/IBM";
      palette = {
        base00 = "161616";
        base01 = "262626";
        base02 = "393939";
        base03 = "525252";
        base04 = "dde1e6";
        base05 = "f2f4f8";
        base06 = "ffffff";
        base07 = "08bdba";
        base08 = "3ddbd9";
        base09 = "78a9ff";
        base0A = "ee5396";
        base0B = "33b1ff";
        base0C = "ff7eb6";
        base0D = "42be65";
        base0E = "be95ff";
        base0F = "82cfff";
      };
    };
    image = ./../../../wallpapers/otherWallpaper/oxocarbon/sollee.png;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Fonts";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 14;
        terminal = 14;
      };
    };
    opacity = {
      terminal = 0.8;
      popups = 0.8;
      desktop = 0.8;
    };
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 24;
    };
    iconTheme = {
      enable = true;
      package = inputs.oxocarbon-folders.packages.${system}.oxocarbon-folders;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
