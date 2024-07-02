{ ... }:

{
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 51413 8010 8080 8384 6969 3000 ];
    allowedUDPPorts = [ 51413 ];
  };
}
