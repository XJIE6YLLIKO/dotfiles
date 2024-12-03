{
  inputs,
  username,
  host,
  ...
}:
{
  imports =
    #[(import ./aseprite/aseprite.nix)]         # pixel art editor
    [ (import ./audacious/audacious.nix) ] # music player
    ++ [ (import ./bat.nix) ] # better cat command
    ++ [ (import ./browser.nix) ]
    ++ [ (import ./btop.nix) ] # resouces monitor
    # ++ [(import ./cava.nix)]                      # audio visualizer
    ++ [ (import ./emacs.nix) ]
    # ++ [(import ./discord.nix)]                   # discord with catppuccin theme
    ++ [ (import ./rofi/rofi.nix) ]
    ++ [ (import ./gaming.nix) ] # packages related to gaming
    ++ [ (import ./steam.nix) ]
    ++ [ (import ./git.nix) ] # version control
    ++ [ (import ./gtk.nix) ] # gtk theme
    ++ [ (import ./hyprland) ] # window manager
    ++ [ (import ./kitty.nix) ] # terminal
    ++ [ (import ./nvim.nix) ] # neovim editor
    ++ [ (import ./packages.nix) ] # other packages
    ++ [ (import ./python.nix) ]
    # ++ [(import ./retroarch.nix)]
    ++ [ (import ./scripts/scripts.nix) ] # personal scripts
    ++ [ (import ./spicetify.nix) ] # spotify client
    ++ [ (import ./starship.nix) ] # shell prompt
    ++ [ (import ./stylix/stylix.nix) ]
    ++ [ (import ./qt.nix) ]
    ++ [ (import ./youtube.nix) ]
    ++ [ (import ./zsh.nix) ] # shell
    # ++ [(import ./zellij.nix)]                    # terminal multiplexer
    ++ [ (import ./notes.nix) ];
}
