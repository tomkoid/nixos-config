{ pkgs, mainUser, ... }:

#let
#  tokyo-night = pkgs.libsForQt5.callPackage ../../../packages/sddm-tokyo-night.nix { };
#in
{
  services.xserver = {
    enable = true;
    #displayManager.sddm = {
    #  enable = true;
    #  autoNumlock = true;
    #  wayland.enable = true;
    #  theme = "tokyo-night-sddm";
    #};
    displayManager.gdm.enable = true;
  };

  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "${mainUser}";
    };
    defaultSession = "hyprland";
  };

  environment.systemPackages = [
    #tokyo-night
    #pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
