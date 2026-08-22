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
    inputs@{ nixpkgs, flake-parts, ... }:
    let
      inherit (nixpkgs) lib;

      collectNix =
        dir:
        let
          entries = builtins.readDir dir;
        in
        lib.concatMap (
          name:
          let
            path = dir + "/${name}";
            type = entries.${name};
          in
          if type == "directory" then
            collectNix path
          else if type == "regular" && lib.hasSuffix ".nix" name then
            [ path ]
          else
            [ ]
        ) (builtins.attrNames entries);

      collectHostConfigurations =
        dir:
        let
          entries = builtins.readDir dir;
        in
        lib.concatMap (
          name:
          let
            path = dir + "/${name}";
            type = entries.${name};
            configuration = path + "/configuration.nix";
          in
          if type == "directory" then
            (lib.optional (builtins.pathExists configuration) configuration) ++ collectHostConfigurations path
          else
            [ ]
        ) (builtins.attrNames entries);

    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        (
          { lib, ... }:

          {
            options = {
              nixos.modules = lib.mkOption {
                type = lib.types.attrsOf lib.types.deferredModule;
                default = { };
                description = "Reusable NixOS modules.";
              };

              home.modules = lib.mkOption {
                type = lib.types.attrsOf lib.types.deferredModule;
                default = { };
                description = "Reusable Home Manager modules.";
              };
            };

            config.systems = [ ];
          }
        )
      ]
      ++ collectNix ./modules
      ++ collectHostConfigurations ./hosts;
    };
}
