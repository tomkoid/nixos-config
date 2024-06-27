{ lib, config, ... }:

{
  options = {
    myConfig.dconf.enable = lib.mkEnableOption "enable git support";
  };

  config = lib.mkIf config.myConfig.dconf.enable {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };
  };
}
