{ pkgs, inputs, ... }:

{
  imports = [
    ./direnv.nix
    ./git.nix
    ./neofetch.nix
    ./starship.nix
    ./tmux.nix
    #./zsh.nix
  ];
}
