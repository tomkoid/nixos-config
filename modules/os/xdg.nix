{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal
    ];
  };
}
