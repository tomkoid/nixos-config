{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    # GAMES
    pkgs.lutris
    pkgs.minetest
    pkgs.prismlauncher
    inputs.pollymc.packages.${system}.pollymc
  ];
}
