{ lib, ... }:
{
  programs.kitty = {
    enable = true;

    font = lib.mkForce {
      name = "JetBrainsMono Nerd Font";
      size = 13;
    };

    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = "yes";
      window_padding_width = 10;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}:{title}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      # active_tab_foreground = "#1e1e2e";
      # active_tab_background = "#89dceb";
      # inactive_tab_foreground = "#bac2de";
      # inactive_tab_background = "#313244";

      enabled_layouts = "Grid, Fat, Horizontal";
      cursor_trail = 3;

      foreground = "#dde1e6";
      background = "#161616";
      selection_foreground = "#f2f4f8";
      selection_background = "#525252";

      cursor = "#f2f4f8";
      cursor_text_color = "#393939";

      url_color = "#ee5396";
      url_style = "single";

      active_border_color = "#ee5396";
      inactive_border_color = "#ff7eb6";

      bell_border_color = "#ee5396";

      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      active_tab_foreground = "#161616";
      active_tab_background = "#ee5396";
      inactive_tab_foreground = "#dde1e6";
      inactive_tab_background = "#393939";
      tab_bar_background = "#161616";

      color0 = "#262626";
      color8 = "#393939";

      color1 = "#ff7eb6";
      color9 = "#ff7eb6";

      color2 = "#42be65";
      color10 = "#42be65";

      color3 = "#82cfff";
      color11 = "#82cfff";

      color4 = "#33b1ff";
      color12 = "#33b1ff";

      color5 = "#ee5396";
      color13 = "#ee5396";

      color6 = "#3ddbd9";
      color14 = "#3ddbd9";

      color7 = "#dde1e6";
      color15 = "#ffffff";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
      "alt+6" = "goto_tab 6";
      "alt+7" = "goto_tab 7";
      "alt+8" = "goto_tab 8";
      "alt+9" = "goto_tab 9";
      "alt+0" = "goto_tab 10";
      "ctrl+shift+r" = "set_tab_title";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };

  };
}
