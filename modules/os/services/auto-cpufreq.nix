{ lib, config, ... }:

{
  options = {
    myConfig.auto-cpufreq.enable = lib.mkEnableOption "enables auto-cpufreq";
  };

  config = lib.mkIf config.myConfig.auto-cpufreq.enable {
    programs.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
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
