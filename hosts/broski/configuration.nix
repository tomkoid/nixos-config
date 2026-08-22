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
      config.nixos.modules.audio
      config.nixos.modules.desktop
      config.nixos.modules.firewall
      config.nixos.modules.fonts
      config.nixos.modules.gaming
      config.nixos.modules.nix
      config.nixos.modules.packages
      config.nixos.modules.programs
      config.nixos.modules.security
      config.nixos.modules.services
      config.nixos.modules.users
      inputs.home-manager.nixosModules.default
      {
        nixpkgs.pkgs = pkgs;
      }
      {
        networking.hostName = "broski";
        networking.networkmanager.enable = true;

        time.timeZone = "Europe/Prague";

        system.stateVersion = "26.05";

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.tom = {
            imports = [
              config.home.modules.development
              config.home.modules.dotfiles
              config.home.modules.services
              config.home.modules.theme
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
