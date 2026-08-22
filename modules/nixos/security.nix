{
  config.flake.nixosModules.security = {
    security.sudo = {
      enable = true;
      extraRules = [
        {
          users = [ "tom" ];
          commands = [
            {
              command = "ALL";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };

    services.fprintd.enable = true;
  };
}
