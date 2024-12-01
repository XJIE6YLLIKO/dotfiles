{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    texlive.combined.scheme-medium
    hunspell
    ydotool
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraPackages = epkgs:
      [
        epkgs.vterm
        epkgs.emacs-everywhere
      ];
    extraConfig = ''
      (setq vterm-shell "${pkgs.zsh.drvPath}/bin/zsh")
    '';
  };
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
}
