{
  config.flake.homeModules.services = {
    programs.gpg.enable = true;

    services = {
      mpris-proxy.enable = true;
      syncthing.enable = true;
    };
  };
}
