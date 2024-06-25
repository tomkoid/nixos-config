{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      mainUser = "tom";
      flakeDir = "/home/${mainUser}/system";
      pkgs = import nixpkgs {
        config = {
          inherit system;
          allowUnfree = true;
        };
      };
      # overlay-unstable = final: prev: {
      #   unstable = nixpkgs-unstable.legacyPackages.${prev.system};
      #   # use this variant if unfree packages are needed:
      #   # unstable = import nixpkgs-unstable {
      #   #   inherit system;
      #   #   config.allowUnfree = true;
      #   # };
      #
      # };
    in
    {
      nixosConfigurations.tomkoid = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit mainUser; inherit flakeDir; };
        modules = [
          # ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
