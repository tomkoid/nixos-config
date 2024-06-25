{ config, lib, pkgs, ... }:

{
  options = {
    myConfig.gaming.enable = lib.mkEnableOption "enables gaming module";
    myConfig.gaming.steam.enable = lib.mkOption {
      default = true;
      description = "enables Steam";
    };
    myConfig.gaming.tools.enable = lib.mkOption {
      default = true;
      description = "enables gamemode, mangohud and gamescope";
    };
  };

  config = lib.mkIf config.myConfig.gaming.enable {
    # Steam Configuration
    programs.steam = lib.mkIf config.myConfig.gaming.steam.enable {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = lib.mkIf config.myConfig.gaming.tools.enable true;
    };

    environment.systemPackages = lib.mkIf config.myConfig.gaming.tools.enable [
      pkgs.mangohud
    ];

    programs.gamescope.enable = lib.mkIf config.myConfig.gaming.tools.enable true;
    programs.gamemode.enable = lib.mkIf config.myConfig.gaming.tools.enable true;
  };
}
