{config, pkgs,lib, ...}:
let
#Declare for style
  style = "./Themes/Styles/type-1/style-9.rasi";
in {
  imports = [
    ./scripts.nix
  ];
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; #Set package to rofi-wayland for Hyprland

    plugins = with pkgs; [
      #Rofi plugins
      # rofi-calc
      # rofi-top
      rofi-emoji-wayland
    ];
    font = "Jetbrains Mono Nerd Font 14";
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = lib.mkForce "${style}";
    extraConfig = {
      modes = ["drun" "run" "window" "files" "calc" "top"];
    };
  };
  home.packages = with pkgs; [
  #Plugins that aren't directly included
    rofi-bluetooth
     ];
  home.file.".config/rofi/colors" = { source = ./Themes/colors; recursive = true; };
  home.file.".config/rofi/Themes" = { source = ./Themes; recursive = true; };
}
