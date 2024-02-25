{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    kitty
    htop
    libnotify
    polkit_gnome
    gnome.gnome-keyring
    gparted
    grim
    slurp
    swappy
    hyprshot
    swayidle
    swaylock
    xss-lock
    unzip
    unrar
    brightnessctl
    vlc
    mpv
    hping
    gnumake
    nodejs_21
    go
    rustup
    python3Full
    python311Packages.setuptools
    mold
    sqlite
    wineWowPackages.stable
  ];
}
