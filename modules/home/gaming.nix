{
  pkgs,
  config,
  inputs,
  ...
}:
{

  home.packages = with pkgs; [
    ## Utils
    gamemode
    gamescope
    bottles
    # winetricks
    # inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    ## Cli games
    _2048-in-terminal
    #nethack

    unciv
    starsector
    hase
    openttd
    brogue-ce
    _4d-minesweeper
    mindustry-wayland
    lincity_ng

    ## Celeste
    #celeste-classic
    #celeste-classic-pm

    ## Doom
    # gzdoom
    #crispy-doom

    ## Emulation
    #sameboy
    #snes9x
    # cemu
    # dolphin-emu
  ];
}
