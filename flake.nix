{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
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
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      nixosConfigurations.netherite = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit mainUser; inherit flakeDir; inherit system; };
        modules = [
          # ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./hosts/netherite/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; inherit mainUser; };
              users.${mainUser}.imports = [
                ./hosts/netherite/home.nix
              ];
            };
          }
          inputs.lix-module.nixosModules.default
          inputs.auto-cpufreq.nixosModules.default
        ];
      };
    };
}
