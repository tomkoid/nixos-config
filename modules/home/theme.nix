{
  config.home.modules.theme =
    { pkgs, ... }:

    {
      home.pointerCursor = {
        enable = true;
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      gtk = {
        enable = true;
        cursorTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };
        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
        iconTheme = {
          name = "Papirus-Dark";
          package = pkgs.papirus-icon-theme;
        };
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      };

      dconf = {
        enable = true;
        settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };

      qt = {
        enable = true;
        style = {
          name = "breeze";
          package = pkgs.kdePackages.breeze;
        };
        platformTheme.name = "kde";
      };

      xdg.configFile."kdeglobals".source =
        "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
    };
}
