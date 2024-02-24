{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [

    # Add any missing dynamic libraries for unpackaged programs

    # here, NOT in environment.systemPackages
    stylua
    lua-language-server
    fuse
    libz
    zlib
    gtk3
    gtk4.dev
    gtk4
    gtk2-x11
    gdk-pixbuf
    pango
    glib
    glibc
    openssl
    xorg.xorgserver
    xorg.libX11
    xorg.libXi
    xorg.libXtst
  ];
}
