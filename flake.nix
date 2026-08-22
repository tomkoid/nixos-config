{
  description = "my nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yadal = {
      url = "github:tomkoid/yadal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tiddl = {
      url = "github:tomkoid/tiddl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      inherit (inputs.nixpkgs) lib;
      inherit (lib.fileset) toList fileFilter;

      isNixModule =
        file:
        file.hasExt "nix"
        && file.name != "flake.nix"
        && file.name != "hardware-configuration.nix"
        && !lib.hasPrefix "_" file.name;

      importTree = path: toList (fileFilter isNixModule path);

      mkFlake = inputs.flake-parts.lib.mkFlake { inherit inputs; };
    in
    mkFlake {
      systems = [ ];
      imports = [
        (
          { lib, ... }:

          {
            options.flake.homeModules = lib.mkOption {
              type = lib.types.attrsOf lib.types.deferredModule;
              default = { };
            };
          }
        )
      ]
      ++ importTree ./modules
      ++ importTree ./hosts;
    };
}
