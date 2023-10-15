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
    gnumake
    pkg-config
    fontconfig
    gtk4
    gtk3
    gtk2
    gtk-doc
    gobject-introspection
    gdk-pixbuf
    gdk-pixbuf-xlib
    pango
    pangomm
    cairo
    cairomm
    atkmm
    glib
    gio-sharp
    vala
    mold
    meson
    ninja
    nodejs_20
    rustup
  ];
}
