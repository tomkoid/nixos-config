{ lib, config, pkgs, ... }:

{
  options = {
    myConfig.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.myConfig.starship.enable {
    programs.starship = {
      enable = true;
    };
  };
}
