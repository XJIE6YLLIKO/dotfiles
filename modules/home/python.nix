{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.fix-python.packages.${system}.default
    (python3.withPackages (ps: with ps; [
      debugpy
    ]))
  ];
}
