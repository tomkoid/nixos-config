{ config, lib, ... }:

let
  dotfilesSource = ../../dotfiles;
  dotfilesTarget = "${config.home.homeDirectory}/nix/dotfiles";
  dotfileDirs = lib.filterAttrs (_: type: type == "directory") (builtins.readDir dotfilesSource);
in
{
  home.file = lib.mapAttrs' (name: _: {
    name = ".config/${name}";
    value.source = config.lib.file.mkOutOfStoreSymlink "${dotfilesTarget}/${name}";
  }) dotfileDirs;
}
