{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs-slim_23
    #nix lang
    nixd
    nixfmt-rfc-style
    #C* langs
    clang-tools
    # python
    black

    texlive.combined.scheme-medium
    hunspell
    ydotool
    xclip
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.emacs-everywhere
    ];
    # extraConfig = ''
    #   (setq vterm-shell "${pkgs.zsh.drvPath}/bin/zsh")
    # '';
  };
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
}
