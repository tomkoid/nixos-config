{ home, pkgs, ... }:

{
  home.packages = [
    pkgs.gnome.nautilus
    pkgs.xfce.thunar
  ];
}
