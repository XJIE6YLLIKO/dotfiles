{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

  };
    home.file."/home/xjie6//.config/zellij/config.kdl".text = ''
      theme "catppuccin-mocha"

      scrollback_editor "nvim"

      keybinds {
        shared_except "locked" {
          bind "Alt f" {
            LaunchPlugin "filepicker" {
              floating true // uncomment this to have the filepicker opened in a floating window
              close_on_selection true // comment this out to have the filepicker remain open even after selecting a file
            };
          }
        }
      }
  '';
}
