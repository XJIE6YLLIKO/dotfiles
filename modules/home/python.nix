{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    basedpyright
    inputs.fix-python.packages.${system}.default
    (python3.withPackages (
      ps: with ps; [
        debugpy
      ]
    ))
  ];
}
