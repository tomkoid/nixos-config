{ pkgs, config, lib, ... }:

{
  options = {
    myConfig.docker.enable = lib.mkEnableOption "enables docker";
  };

  config = lib.mkIf config.myConfig.docker.enable {
    virtualisation.docker = {
      enable = true;
      package = pkgs.docker_27;
    };
  };
}
