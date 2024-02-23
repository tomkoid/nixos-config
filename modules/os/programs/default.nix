{ pkgs, inputs, ... }:

{
  imports = [
    ./sudo.nix
    ./adb.nix
    ./noisetorch.nix
    ./swaylock.nix
    ./virt-manager.nix
    ./waydroid.nix
  ];
}
