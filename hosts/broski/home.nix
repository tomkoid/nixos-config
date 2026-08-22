{ ... }:

{
  imports = [
    ../../modules/home/development.nix
    ../../modules/home/dotfiles.nix
    ../../modules/home/services.nix
    ../../modules/home/theme.nix
  ];

  home.username = "tom";
  home.homeDirectory = "/home/tom";

  home.stateVersion = "26.05";
}
