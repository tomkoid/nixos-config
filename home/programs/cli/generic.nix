{ home, pkgs, system, inputs, ... }:

let
  unstable = import inputs.unstable {
    inherit system;
  };
in
{
  imports = [
    ./lazygit.nix
  ];

  home.packages = [
    pkgs.htop
    pkgs.gping
    pkgs.ripgrep
    pkgs.du-dust
    pkgs.ani-cli
    pkgs.neofetch
    pkgs.nitch
    pkgs.pamixer
    pkgs.alsa-utils
    pkgs.grim
    pkgs.slurp
    inputs.mdhtml.defaultPackage.${system}
  ];
}
