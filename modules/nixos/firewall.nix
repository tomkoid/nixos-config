{
  config.nixos.modules.firewall = {
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
