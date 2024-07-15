{ config, lib, mainUser, ... }:

{
  options = {
    myConfig.syncthing.enable = lib.mkEnableOption "enable syncthing";
  };

  config = lib.mkIf config.myConfig.syncthing.enable {
    services.syncthing = {
      enable = true;
      user = mainUser;
      dataDir = "/home/${mainUser}"; # Default folder for new synced folders
      configDir = "/home/${mainUser}/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
