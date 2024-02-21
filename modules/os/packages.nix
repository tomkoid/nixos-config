{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    kitty
    htop
    libnotify dunst
    grim slurp swappy hyprshot
    swaylock xss-lock
    vlc mpv
    hping
    gnumake
    nodejs_21 go rustup
    sqlite
    wineWowPackages.stable 
  ];
}
