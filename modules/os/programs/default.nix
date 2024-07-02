{ pkgs, inputs, ... }:

{
  imports = [
    ./adb.nix
    ./sudo.nix
    ./nix-helper.nix
    ./noisetorch.nix
    ./swaylock.nix
    ./virt-manager.nix
    ./waydroid.nix
  ];
}
