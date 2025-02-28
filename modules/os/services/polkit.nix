{ config, pkgs, lib, ... }:

{
  options = {
    myConfig.polkit.enable = lib.mkEnableOption "enables polkit";
  };

  config = lib.mkIf config.myConfig.polkit.enable {
    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        enable = true;
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
    #
    # systemd = {
    #   user.services.polkit-gnome-authentication-agent-1 = {
    #     enable = true;
    #     description = "polkit-gnome-authentication-agent-1";
    #     wantedBy = [ "graphical-session.target" ];
    #     partOf = [ "graphical-session.target" ];
    #     serviceConfig = {
    #       Type = "simple";
    #       ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #       Restart = "always";
    #       RestartSec = 1;
    #       TimeoutStopSec = 10;
    #     };
    #   };
    # };

    security.polkit.enable = true;

    security.polkit.extraConfig = ''
      polkit.addRule(function(action, subject) {
          if (
              subject.isInGroup("users")
              && (
                action.id == "org.freedesktop.login1.reboot" ||
                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
                action.id == "org.freedesktop.login1.power-off" ||
                action.id == "org.freedesktop.login1.power-off-multiple-sessions"
                )
             )
          {
          return polkit.Result.YES;
          }
          })
    '';
  };
}
