{ home, pkgs, system, inputs, ... }:

{
  home.packages = [
    pkgs.htop
    pkgs.gping
    pkgs.zoxide
    pkgs.ripgrep
    pkgs.du-dust
    pkgs.ani-cli
    pkgs.neofetch
    pkgs.pamixer
    pkgs.alsa-utils
    pkgs.grim
    pkgs.slurp
  ];
}
