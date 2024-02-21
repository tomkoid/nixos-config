{ pkgs, inputs, ... }:

{
  imports = [
    ./sudo.nix
    ./adb.nix
    ./noisetorch.nix
    ./virt-manager.nix
  ];
}
