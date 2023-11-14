{ pkgs, ... }:

{
  services.i2pd = {
    enable = true; # no extra config
    proto.httpProxy.enable = true;
    proto.http.enable = true;
    outTunnels = {
      minetest = {
        name = "udpclient";
        enable = true;
        address = "127.0.0.1";
        port = 30000;
        destination = "zedyihtf37vl7pk3pzgjikmjzupoagzdru2zuvqjuyedyevd3ipa.b32.i2p";
        destinationPort = 30000;
        keys = "minetest.dat";
        inbound.length = 1;
        outbound.length = 1;
      };
    };
  };

  systemd.services.i2pd = {
    wantedBy = pkgs.lib.mkForce [ ];
  };
}
