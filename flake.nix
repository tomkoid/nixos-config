{
  description = "My NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    pollymc.url = "github:fn2006/PollyMC/develop";
    mdhtml.url = "git+https://codeberg.org/Tomkoid/mdhtml";
    thorium-browser.url = "git+https://codeberg.org/Tomkoid/thorium-browser-nix";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      username = "tom";
    in
    {
      nixosConfigurations = {
        nixos = inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit system;
            inherit inputs;
            inherit outputs;
            inherit username;
          };

          modules = [
            ./os/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "tom@tomkoid" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;

            config.allowUnfree = true;
          }; # Home-manager requires 'pkgs' instance

          extraSpecialArgs = {
            inherit inputs outputs system username;
          };

          # > Our main home-manager configuration file <
          modules = [ ./home/home.nix ];
        };
      };
    };
}
