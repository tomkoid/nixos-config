{
  description = "My NixOS system";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    inherit (self) outputs;

    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { 
          inherit system; 
          inherit inputs;
          inherit outputs;
        };

        modules = [
          ./nixos/configuration.nix
        ];
      };
    };
  };
}
