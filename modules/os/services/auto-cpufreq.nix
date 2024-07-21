{ lib, config, ... }:

{
  options = {
    myConfig.auto-cpufreq.enable = lib.mkEnableOption "enables auto-cpufreq";
  };

  config = lib.mkIf config.myConfig.auto-cpufreq.enable {
    services.auto-cpufreq = {
      enable = false;
      settings = {
        battery = {
          governor = "performance";
          turbo = "auto";
        };
        charger = {
          governor = "performance";
          turbo = "always";
        };
      };
    };
  };
}
