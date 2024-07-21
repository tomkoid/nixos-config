{ config, lib, ... }:

{
  options = {
    myConfig.atuin.enable = lib.mkEnableOption "enable atuin";
  };

  config = lib.mkIf config.myConfig.atuin.enable {
    programs.atuin.enable = true;
  };
}
