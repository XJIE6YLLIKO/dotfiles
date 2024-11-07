#{ pkgs, ... }:
#{
#  programs.neovim = {
#    enable = true;
#    vimAlias = true;
#    defaultEditor = true;
    # plugins = with pkgs.vimPlugins; [
      # nvchad
      # nvchad-ui
    # ];
  # };
# }

{ config, pkgs, inputs, ... }: {  # <-- inputs from flake
  
  home.sessionVariables.EDITOR = "nvim";
  
  nixpkgs = { 
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };
  # home.packages = with pkgs; [ pkgs.nvchad ];
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];
  programs.nvchad = {
    enable = true;

    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      nixd
      ast-grep
      (python3.withPackages(ps: with ps; [
        python-lsp-server
        flake8
      ]))
    ];
    hm-activation = true;
    backup = false;
  };
}

