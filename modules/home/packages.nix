{ pkgs, config, mainUser, ... }:

{
  home.packages = with pkgs; [
    keepassxc
    obs-studio
    element-desktop
    discord
    efm-langserver
    gamemode
    mpd mpc-cli ncmpcpp
    wget zoxide eza pamixer yt-dlp ripgrep bat gping
    fish
    xfce.thunar gnome.nautilus
    wl-clipboard swww swaybg wofi waybar fzf
    gimp kdenlive inkscape eartag
    gnome.gnome-system-monitor
    transmission-gtk

    # BROWSERS
    brave
    firefox
    ungoogled-chromium

    # GAMES
    lutris
    minetest
    prismlauncher
    airshipper
    osu-lazer

    #proton stuff
    protonup-qt
  ];
}
