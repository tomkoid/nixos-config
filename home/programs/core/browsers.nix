{ home, pkgs, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs.librewolf
    pkgs.firefox
    pkgs.ungoogled-chromium
  ];
}
