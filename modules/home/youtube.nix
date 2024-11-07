{ pkgs, config, inputs, ... }: 
{
  home.packages = with pkgs;[

    freetube

  ];
}