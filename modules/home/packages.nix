{ pkgs, config, mainUser, ... }:

{
  home.packages = with pkgs; [
    keepassxc
    obs-studio
    element-desktop
    discord
    efm-langserver
    lutris gamemode mangohud
    xautoclick
    mpd mpc-cli ncmpcpp
    wget zoxide eza pamixer yt-dlp ripgrep bat gping
    fish
    xfce.thunar gnome.nautilus
    wl-clipboard wlsunset wluma swww swaybg wofi waybar fzf dust
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
    openarena
    osu-lazer

    #proton stuff
    protonup-qt
  ];
}
