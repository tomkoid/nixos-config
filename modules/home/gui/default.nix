{ pkgs, inputs, ...}:

{
  imports = [
    ./gtk-qt.nix
    ./librewolf.nix
  ];
}
