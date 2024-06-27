{ pkgs, inputs, flakeDir, config, ... }:

{
  imports = [
    ./gui
    ./cli
    ./tools
    ./services
    ./files.nix
    ./packages.nix
    ./services.nix
  ];
}
