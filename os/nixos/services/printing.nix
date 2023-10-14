{ pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.avahi.enable = true; # runs the Avahi daemon
  services.avahi.nssmdns = true; # enables the mDNS NSS plug-in
  services.avahi.openFirewall = true; # opens the firewall for UDP port 5353
}
