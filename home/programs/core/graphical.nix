{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    inputs.unstable.legacyPackages.${system}.neovide
    pkgs.element-desktop
    pkgs.signal-desktop
    pkgs.discord
    pkgs.keepassxc
    pkgs.mpv
    pkgs.gimp
    pkgs.inkscape
    pkgs.eww-wayland
    pkgs.thunderbird
    pkgs.rofi-wayland
    pkgs.cambalache
    pkgs.gnome.eog
    pkgs.gnome.simple-scan
    pkgs.feh
    pkgs.godot_4
    pkgs.android-studio
    # pkgs.ventoy-full
    pkgs.ventoy
    pkgs.transmission-gtk
    pkgs.blender
    pkgs.kdenlive
    pkgs.gnome.gnome-tweaks
    pkgs.gnome-text-editor
    pkgs.libreoffice-fresh
  ];
}
