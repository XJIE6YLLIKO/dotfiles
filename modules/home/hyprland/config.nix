{ pkgs, ... }: 
{
 wayland.windowManager.hyprland = {
    settings = {

      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "hyprpanel &"
        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        # "hyprctl setcursor catppuccin-mocha-dark-cursors 24 &"
        # "xsetroot -xcf ${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors/cursors/X_cursor 24 &"
        # "waybar &"
        # "swaync &"
        "wl-paste --watch cliphist store &"
        # "hyprlock"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options ="grp:alt_shift_toggle"; 
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
        };
        accel_profile = "flat";
      };

      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 2;
        # "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        # "col.inactive_border" = "0x00000000";
        border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      # group = {
      #   "col.border_active" = "rgb(fab387) rgb(89b4fa) 45deg";
      #   "col.border_inactive" = "0x00000000";
      #   groupbar = {
      #     text_color = "rgb(cdd6f4)";
      #     "col.active" = "0x5501e1e2e";
      #     "col.inactive" = "0x55181825";
      #   };
      # };

      dwindle = {
        # no_gaps_when_only = true;
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
        # no_gaps_when_only = false;
      };

      decoration = {
        rounding = 5;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        # shadow = {
        #   enabled = true;

        #   ignore_window = true;
        #   offset = "0 2";
        #   range = 20;
        #   render_power = 3;
        #   color = "rgba(00000055)";
        # };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        # show keybinds list
        "$mainMod, F1, exec, show-keybinds"

        # keybindings
        "$mainMod, code:51, exec, emacsclient --eval '(emacs-everywhere)'"
        "$mainMod, Return, exec, kitty"
        "ALT, Return, exec, kitty --title float_kitty"
        "$mainMod SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "$mainMod, code:56, exec, zen"
        "$mainMod, code:24, killactive,"
        "$mainMod, code:41, fullscreen, 0"
        "$mainMod SHIFT, code:41, fullscreen, 1"
        "$mainMod, Space, togglefloating,"
        "$mainMod, code:40, exec, QT_STYLE_OVERRIDE=kvantum rofi -show drun"
        "$mainMod, code:61, exec, rofi -modi emoji -show emoji"
        # "$mainMod SHIFT, code:40, exec, hyprctl dispatch exec '[workspace 4 silent] discord --enable-features=UseOzonePlatform --ozone-platform=wayland'"
        # "$mainMod SHIFT, code:39, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mainMod, Escape, exec, hyprlock"
        "$mainMod SHIFT, Escape, exec, rofi-power-menu"
        "$mainMod, F2, exec, rofi-bluetooth"
        "$mainMod, code:33, pseudo,"
        "$mainMod, code:32, togglesplit,"
        "$mainMod, code:26, exec, thunar"
        "$mainMod, code:54, exec, hyprpicker -a"
        "$mainMod, code:25, exec, wallpaper-picker"
        # "$mainMod SHIFT, code:25, exec, vm-start"
        "$mainMod, code:39, togglegroup"
        "$mainMod ALT, code:44, changegroupactive, f"
        "$mainMod ALT, code:45, changegroupactive, b"

        # screenshot
        "$mainMod, Print, exec, grimblast --notify --cursor --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --cursor --freeze copy area"

        # switch focus
        "$mainMod, code:43, movefocus, l"
        "$mainMod, code:46, movefocus, r"
        "$mainMod, code:45, movefocus, u"
        "$mainMod, code:44, movefocus, d"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, code:49, togglespecialworkspace"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod SHIFT, code:49, movetoworkspacesilent, special"
        "$mainMod CTRL, code:54, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, code:43, movewindow, l"
        "$mainMod SHIFT, code:46, movewindow, r"
        "$mainMod SHIFT, code:45, movewindow, u"
        "$mainMod SHIFT, code:44, movewindow, d"
        "$mainMod CTRL, code:43, resizeactive, -80 0"
        "$mainMod CTRL, code:46, resizeactive, 80 0"
        "$mainMod CTRL, code:45, resizeactive, 0 -80"
        "$mainMod CTRL, code:44, resizeactive, 0 80"
        "$mainMod ALT, code:43, moveactive,  -80 0"
        "$mainMod ALT, code:46, moveactive, 80 0"
        "$mainMod ALT, code:45, moveactive, 0 -80"
        "$mainMod ALT, code:44, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 2"
        ",XF86AudioLowerVolume,exec, pamixer -d 2"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "$mainMod, code:55, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "float,imv"
        "center,imv"
        "size 1200 725,imv"
        "float,mpv"
        "center,mpv"
        "tile,Aseprite"
        "size 1200 725,mpv"
        "float,title:^(float_kitty)$"
        "center,title:^(float_kitty)$"
        "size 950 600,title:^(float_kitty)$"
        "float,audacious"
        "workspace 8 silent, audacious"
        # "pin,wofi"
        # "float,wofi"
        # "noborder,wofi"
        "tile, neovide"
        "idleinhibit focus,mpv"
        "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"
      ];

      # windowrulev2
      windowrulev2 = [
        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(zenity)$"
        "center,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "float,class:^(pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

    };

    extraConfig = "
      monitor = eDP-1, 1920x1080@60, 1920x0, 1
      monitor = HDMI-A-1, 1920x1080@165, 0x0, 1
      monitor=,preferred, 0x0,auto

      workspace = 1, monitor:HDMI-A-1
      workspace = 2, monitor:eDP-1

      xwayland {
        force_zero_scaling = true
      }

      envd = QT_STYLE_OVERRIDE,kvantum
      envd = QT_QPA_PLATFORMTHEME,kvantum
      ";
  };
}
