{ pkgs, lib, config, ... }:

{
  options = {
    myConfig.git.enable = lib.mkEnableOption "enable git";
  };

  config = lib.mkIf config.myConfig.git.enable {
    programs.git = {
      enable = true;
      userName = "Tomkoid";
      userEmail = "tomaszierl@outlook.com";
      delta = {
        enable = true;
      };
      signing = {
        gpgPath = "${pkgs.gnupg}/bin/gpg";
        key = "D4403E79602EE85B";
        signByDefault = true;
      };
      extraConfig = {
        crendetial.helper = "store";
      };
    };

    # lazygit config
    programs.lazygit = {
      enable = true;
      package = pkgs.lazygit;
      settings = {
        overrideGpg = true;
        git = {
          commit = {
            signOff = true;
          };
          paging = {
            colorArg = "never";
            pager = "delta --dark --paging=never";
          };
        };
      };
    };
  };
}
