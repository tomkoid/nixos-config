{ inputs, ... }:

{
  config.flake.nixosModules.desktop =
    { pkgs, ... }:

    let
      hyprlandPackages = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      services.displayManager = {
        autoLogin = {
          enable = true;
          user = "tom";
        };
        ly.enable = true;
      };

      programs.hyprland = {
        enable = true;
        package = hyprlandPackages.hyprland;
        portalPackage = hyprlandPackages.xdg-desktop-portal-hyprland;
      };

      programs.hyprlock.enable = true;
      programs.dconf.enable = true;

      services.libinput.enable = true;
      services.upower.enable = true;

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
        config.common.default = "*";
      };

      systemd.user.services.polkit-gnome-authentication-agent = {
        description = "GNOME PolicyKit Authentication Agent";
        wantedBy = [ "graphical-session.target" ];
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
}
