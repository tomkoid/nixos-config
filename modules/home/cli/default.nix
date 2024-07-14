{ pkgs, inputs, ... }:

{
  imports = [
    ./atuin.nix
    ./direnv.nix
    ./git.nix
    ./neofetch.nix
    ./starship.nix
    ./tmux.nix
    #./zsh.nix
  ];
}
