{ pkgs, inputs, ...}:

{
  imports = [
    ./git.nix
    ./neofetch.nix
    ./starship.nix
    ./tmux.nix
  ];
}
