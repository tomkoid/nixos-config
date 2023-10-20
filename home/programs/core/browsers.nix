{ home, pkgs, inputs, system, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs.librewolf
    pkgs.firefox
    pkgs.ungoogled-chromium
    inputs.thorium-browser.defaultPackage.${system}
  ];
}
