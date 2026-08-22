{ config, inputs, ... }:

let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  config.flake.nixosConfigurations.broski = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      ./hardware-configuration.nix
      config.flake.nixosModules.audio
      config.flake.nixosModules.desktop
      config.flake.nixosModules.firewall
      config.flake.nixosModules.fonts
      config.flake.nixosModules.gaming
      config.flake.nixosModules.nix
      config.flake.nixosModules.packages
      config.flake.nixosModules.programs
      config.flake.nixosModules.security
      config.flake.nixosModules.services
      config.flake.nixosModules.users
      inputs.home-manager.nixosModules.default
      {
        networking.hostName = "broski";
        networking.networkmanager.enable = true;

        time.timeZone = "Europe/Prague";

        system.stateVersion = "26.05";
        nixpkgs.pkgs = pkgs;

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.tom = {
            imports = [
              config.flake.homeModules.development
              config.flake.homeModules.dotfiles
              config.flake.homeModules.services
              config.flake.homeModules.theme
            ];

            home.username = "tom";
            home.homeDirectory = "/home/tom";

            home.stateVersion = "26.05";
          };
        };
      }
    ];
  };
}
