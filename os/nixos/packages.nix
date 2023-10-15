{ pkgs, inputs, system, ... }:

let
  unstable = import inputs.unstable {
    inherit system;
  };
in
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    unstable.neovim
    exa
    delta
    bat
    procs
    yt-dlp

    vulkan-tools
    obs-studio
    gitFull
    wget
    unzip
    kitty
    wofi
    swayidle
    swaylock
    wl-clipboard
    xss-lock
    waybar
    brightnessctl
    starship
    gparted
    parted
    usbutils
    exfat
    ntfs3g
    system-config-printer
    gnome.gnome-font-viewer
    lxappearance
    pavucontrol
    dunst
    wlsunset
    pulseaudio
    libnotify
    polkit_gnome
    tealdeer
    distrobox

    # BUILDING AND PROGRAMMING STUFF
    gcc
    cmake
    wayland
    gnumake
    pkg-config
    fontconfig
    gtk4
    gtk4.dev
    gtk3
    gtk3.dev
    gtk3-x11.dev
    gtk2.dev
    gtk2-x11.dev
    gtk-doc
    gobject-introspection
    gdk-pixbuf
    gdk-pixbuf-xlib
    pango
    pango.dev
    pangomm
    cairo
    cairo.dev
    cairomm
    atkmm
    glib
    glib.dev
    glibc
    glibc.dev
    glibmm
    gst_all_1.gst-plugins-bad
    gst_all_1.gstreamer
    gst_all_1.gst-vaapi
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-rs
    gst_all_1.gst-plugins-base
    gio-sharp
    vala
    mold
    meson
    ninja
    nodejs_20
    rustup
  ];
}
