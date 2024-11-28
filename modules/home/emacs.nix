{ pkgs, ... }:
{
  home.packages = with pkgs; [
    texlive.combined.scheme-medium
  ];

  programs.emacs = {
    enable = true;
  };
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
}
