{ lib, config, pkgs, ... }:

{
  options = {
    printing.enable = lib.mkEnableOption "enable printing";
    printing.HPSupport = lib.mkOption {
      default = false;
      description = "enables printing with hplip";
    };
  };

  config = lib.mkIf config.printing.enable {
    # Enable CUPS to print documents.
    services.printing = {
      enable = true;
      drivers = [ pkgs.hplipWithPlugin ];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    environment.systemPackages = [
      pkgs.system-config-printer
    ];
  };
}
