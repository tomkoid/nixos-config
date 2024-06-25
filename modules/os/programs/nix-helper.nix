{ config, lib, pkgs, inputs, ... }:

let
  flakePath = inputs.self.outPath;
in
{
  options = {
    myConfig.nh.enable = lib.mkEnableOption "enables nix helper"; 
  };

  config = lib.mkIf config.myConfig.nh.enable {
    environment.sessionVariables = {
      FLAKE = flakePath; 
    };

    programs.nh = {
      enable = true;
      flake = flakePath;
    };
  };
}
