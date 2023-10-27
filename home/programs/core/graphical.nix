{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    inputs.unstable.legacyPackages.${system}.neovide
    pkgs.element-desktop
    pkgs.signal-desktop
    pkgs.discord
    pkgs.keepassxc
    pkgs.mpv
    pkgs.eww-wayland
    pkgs.thunderbird
    pkgs.rofi-wayland
    pkgs.transmission-gtk
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-text-editor
    pkgs.libreoffice-fresh
  ];
}
