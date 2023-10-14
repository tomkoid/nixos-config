{
  description = "My NixOS system";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstablepkgs }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };

    unstable = import unstablepkgs {
      inherit system;
    };
  in
  {
    nixosConfigurations = {
      system = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit system; 
          inherit unstable;
        };

        modules = [
          ./nixos/configuration.nix
        ];
      };
    };
  };
}
