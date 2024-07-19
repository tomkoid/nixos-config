{ lib, config, ... }:

{
  options = {
    myConfig.mangohud.enable = lib.mkEnableOption "enables mangohud";
  };

  config = lib.mkIf config.myConfig.mangohud.enable {
    programs.mangohud = {
      enable = true;
    };
  };
}
