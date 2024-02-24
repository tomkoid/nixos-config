{ pkgs, inputs, flakeDir, config, ... }:

{
  imports = [
    ./gui
    ./cli
    ./tools
    ./files.nix
    ./packages.nix
    ./services.nix
  ];
}
