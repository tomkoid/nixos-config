{ pkgs, lib, config, ... }:

{
  options = {
    myConfig.bluetooth.enable = lib.mkEnableOption "enables bluetooth";
  };

  config = lib.mkIf config.myConfig.bluetooth.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;

    systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = [ "network.target" "sound.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}
