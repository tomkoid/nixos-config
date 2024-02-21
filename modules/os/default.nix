{ myConfig, pkgs, inputs, ... }:

{
  imports = [
    ./services
    ./programs
    ./packages.nix
    ./variables.nix
    ./fonts.nix
    ./steam.nix
    ./xdg.nix
  ];
}
