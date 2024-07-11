{ lib, config, ... }:

{
  options = {
    myConfig.direnv.enable = lib.mkEnableOption "enable direnv";
  };

  config = lib.mkIf config.myConfig.direnv.enable {
    programs = {
      direnv = {
        enable = true;
        enableBashIntegration = true; # see note on other shells below
        enableZshIntegration = true; # see note on other shells below
        enableFishIntegration = true; # see note on other shells below
        nix-direnv.enable = true;
      };

      bash.enable = true; # see note on other shells below
    };
  };
}
