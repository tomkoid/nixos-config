{
  description = "My home-manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
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
    in
    {
      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "tom@tomkoid" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;

            config.allowUnfree = true;
          }; # Home-manager requires 'pkgs' instance

          extraSpecialArgs = {
            inherit inputs outputs system;
          };

          # > Our main home-manager configuration file <
          modules = [ ./home.nix ];
        };
      };
    };
}
