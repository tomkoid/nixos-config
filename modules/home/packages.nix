{ pkgs, config, mainUser, ... }:

{
  home.packages = with pkgs; [
    keepassxc
    obs-studio
    element-desktop
    signal-desktop
    whatsapp-for-linux
    discord
    (pkgs.callPackage ../../packages/webcord.nix { }) # webcord
    efm-langserver
    lutris
    xautoclick
    (pkgs.callPackage ../../packages/xclicker.nix { }) # xclicker
    (pkgs.callPackage ../../packages/supershush.nix { }) # supershush
    mpd
    mpc-cli
    ncmpcpp
    wget
    zoxide
    eza
    pamixer
    yt-dlp
    ripgrep
    jq
    bat
    gping
    tealdeer
    fd
    fzf
    dust
    fish
    xfce.thunar
    gnome.nautilus
    wl-clipboard
    wlsunset
    wluma
    swww
    swaybg
    wofi
    fuzzel
    waybar
    helix
    gimp
    kdenlive
    tenacity
    inkscape
    libreoffice
    thunderbird
    android-studio
    eartag
    gnome.gnome-system-monitor
    pavucontrol
    transmission-gtk
    distrobox

    # BROWSERS
    librewolf
    brave
    firefox
    ungoogled-chromium

    # GAMES
    lutris
    minetest
    prismlauncher

    #proton stuff
    protonup-qt
  ];
}
