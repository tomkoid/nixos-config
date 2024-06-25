{ config, lib, ... }:

{
  options = {
    myConfig.steam.enable = lib.mkEnableOption "enables Steam";
  };

  config = lib.mkIf config.myConfig.steam.enable {
    # Steam Configuration
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
