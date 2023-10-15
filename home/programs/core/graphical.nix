{ home, pkgs, ... }:

{
  home.packages = [
    pkgs.element-desktop
    pkgs.discord
    pkgs.keepassxc
    pkgs.mpv
    pkgs.thunderbird
    pkgs.rofi-wayland
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-text-editor
    pkgs.libreoffice-fresh
  ];
}
    ## OTHER GUI PROGRAMS
