{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    alacritty
    kitty
    wezterm
    zsh
    htop
    libnotify
    polkit_gnome
    gnome.gnome-keyring
    gparted
    grim
    slurp
    swappy
    hyprshot
    hyprlock
    hyprpicker
    swappy
    swayidle
    swaylock
    sway-audio-idle-inhibit
    xss-lock
    unzip
    unrar
    brightnessctl
    vlc
    mpv
    playerctl
    hping
    gnumake
    nodejs
    go
    rustup
    python3Full
    python311Packages.setuptools
    mold
    gcc clang
    sqlite
    wineWowPackages.stable
  ];
}
