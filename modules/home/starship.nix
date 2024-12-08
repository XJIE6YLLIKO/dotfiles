{ ... }:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      right_format = "$cmd_duration";

      directory = {
        format = "[ ](bold #ff7eb6)[ $path ]($style)";
        style = "bold #ff7eb6";
      };

      character = {
        success_symbol = "[ ](bold #33b1ff)[ ➜](bold #33b1ff)";
        error_symbol = "[ ](bold #33b1ff)[ ➜](bold #ee5396)";
        vimcmd_symbol = "[ ](bold #33b1ff)[ ➜](bold #3ddbd9)";
      };

      cmd_duration = {
        format = "[󰔛 $duration]($style)";
        disabled = false;
        style = "bg:none fg:#ffab91";
        show_notifications = false;
        min_time_to_notify = 60000;
      };
    };
  };
}
