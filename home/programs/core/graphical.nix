{ home, pkgs, ... }:

{
  home.packages = [
    pkgs.element-desktop
    pkgs.discord
    pkgs.keepassxc
    pkgs.mpv
    pkgs.eww-wayland
    pkgs.thunderbird
    pkgs.rofi-wayland
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-text-editor
    pkgs.libreoffice-fresh
  ];
}
