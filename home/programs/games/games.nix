{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    # GAMES
    pkgs.lutris
    pkgs.minetest
    pkgs.prismlauncher
    pkgs.airshipper
    pkgs.osu-lazer

    # proton stuff
    pkgs.protonup-qt
  ];
}
