{ pkgs, inputs, ... }:

{
  imports = [
    ./gui
    ./cli
    ./tools
    ./packages.nix
    ./services.nix
  ];
}
