{
  config.flake.nixosModules.services = {
    services.printing.enable = true;

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    services.blueman.enable = true;

    services.keyd = {
      enable = true;
      keyboards.externalKeyboard = {
        ids = [ "0001:0001:6fb3735a" ];
        settings.main = {
          capslock = "esc";
          esc = "capslock";
        };
      };
    };

    services.gvfs.enable = true;

    services.tailscale = {
      enable = true;
      openFirewall = true;
    };

    networking.firewall = {
      allowedTCPPorts = [
        8384
        22000
      ];
      allowedUDPPorts = [
        22000
        21027
      ];
    };
  };
}
