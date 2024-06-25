{ pkgs, inputs, ... }:

{
  imports = [
    ./sudo.nix
    ./adb.nix
    ./nix-helper.nix
    ./noisetorch.nix
    ./swaylock.nix
    ./virt-manager.nix
    ./waydroid.nix
  ];
}
