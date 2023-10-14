{ ... }:

{
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=5s
  '';
}
