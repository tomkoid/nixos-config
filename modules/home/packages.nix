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
    gamemode
    mangohud
    xautoclick
    (pkgs.callPackage
      ../../packages/xclicker.nix
      { }) # xclicker
    mpd
    mpc-cli
    ncmpcpp
    wget
    zoxide
    eza
    pamixer
    yt-dlp
    ripgrep
    bat
    gping
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
    waybar
    gimp
    kdenlive
    inkscape
    eartag
    gnome.gnome-system-monitor
    pavucontrol
    transmission-gtk

    # BROWSERS
    brave
    firefox
    ungoogled-chromium

    # GAMES
    lutris
    heroic
    minetest
    prismlauncher
    airshipper
    openarena
    osu-lazer

    #proton stuff
    protonup-qt
  ];
}
