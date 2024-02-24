{ lib, config, pkgs, ... }:

{
  options = {
    myConfig.gtk-qt.enable = lib.mkEnableOption "enable gtk and qt theming";
  };

  config = lib.mkIf config.myConfig.gtk-qt.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "blue" ];
          variant = "mocha";
        };
      };
      cursorTheme = {
        package = pkgs.gnome.adwaita-icon-theme;
        name = "Adwaita";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
    };

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
