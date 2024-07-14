{ config, lib, ... }:

{
  options = {
    myConfig.atuin.enable = lib.mkEnableOption "enable atuin";
  };

  config = lib.mkIf config.myConfig.direnv.enable {
    programs.atuin.enable = true;
  };
}
