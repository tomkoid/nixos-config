{ config, lib, pkgs, inputs, flakeDir, ... }:

let
  flakePath = flakeDir;
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
