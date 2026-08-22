{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/firewall.nix
    ../../modules/nixos/users.nix
  ];

  networking.hostName = "broski";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  system.stateVersion = "26.05";
}
