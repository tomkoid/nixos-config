{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    # GAMES
    pkgs.lutris
    pkgs.minetest
    pkgs.prismlauncher
    pkgs.airshipper
    inputs.pollymc.packages.${system}.pollymc
  ];
}
