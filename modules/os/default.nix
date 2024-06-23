{ pkgs, inputs, ... }:

{
  imports = [
    ./services
    ./programs
    ./packages.nix
    ./variables.nix
    ./fonts.nix
    ./libs.nix
    ./steam.nix
    ./xdg.nix
  ];
}
