{ inputs, lib, config, pkgs, ... }:

{
  options = {
    myConfig.gtk-qt.enable = lib.mkEnableOption "enable gtk and qt theming";
  };

  config = lib.mkIf config.myConfig.gtk-qt.enable {
    gtk = {
      enable = true;
      theme = {
        name = "Colloid-Dark";
        package = pkgs.colloid-gtk-theme;
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
      platformTheme.name = "adwaita";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };
  };
}
