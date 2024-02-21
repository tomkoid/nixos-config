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
    wget neofetch zoxide eza pamixer yt-dlp ripgrep gping
    fish tmux
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
