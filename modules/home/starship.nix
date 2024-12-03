{ lib, inputs, ... }:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      # right_format = "$cmd_duration";

      directory = {
        format = "[ ](bold #ff7eb6)[ $path ]($style)";
        style = "bold #ff7eb6";
      };

      character = {
        success_symbol = "[ ](bold #33b1ff)[ ➜](bold #33b1ff)";
        error_symbol = "[ ](bold #33b1ff)[ ➜](bold #ee5396)";
      };

      cmd_duration = {
        format = "[󰔛 $duration]($style)";
        disabled = false;
        style = "bg:none fg:#ffab91";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      palette = "oxocarbon";
      palettes.oxocarbon = {
        base00 = "#161616";
        base01 = "#262626";
        base02 = "#393939";
        base03 = "#525252";
        base04 = "#dde1e6";
        base05 = "#f2f4f8";
        base06 = "#ffffff";
        base07 = "#08ddba";
        base08 = "#3ddbd9";
        base09 = "#78a9ff";
        base10 = "#ee5396";
        base11 = "#33b1ff";
        base12 = "#ff7eb6";
        base13 = "#42be65";
        base14 = "#be95ff";
        base15 = "#82cfff";
        white = "#f2f4f8";
        bright-white = "#ffffff";
        cyan = "#08ddba";
        bright-cyan = "#3ddbd9";
        purple = "#be95ff";
        yellow = "#ffab91";
        orange = "#ff6f00";
        blue = "#33b1ff";
        green = "#42be65";
        red = "#ee5396";
        black = "#161616";
      };
    };
  };
}
