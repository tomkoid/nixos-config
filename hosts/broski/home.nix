{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  relDotfileDir = ../../dotfiles;
  dotfileDir = "${config.home.homeDirectory}/nix/dotfiles";
  allFiles = builtins.readDir relDotfileDir;
  justDirs = lib.filterAttrs (name: type: type == "directory") allFiles;
in
{
  home.username = "tom";
  home.homeDirectory = "/home/tom";

  # sync dotfiles dir
  home.file = lib.mapAttrs' (name: value: {
    name = ".config/${name}";
    value = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfileDir}/${name}";
    };
  }) justDirs;

  # imports = [ inputs.catppuccin.homeModules.catppuccin ];
  home.pointerCursor = {
    enable = true; # Explicitly enable pointer cursor configuration
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita"; # Exact theme name inside the package
    size = 24; # Desired cursor size
    gtk.enable = true; # Apply to GTK applications
    x11.enable = true; # Apply to X11/Xserver sessions
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
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
    platformTheme = {
      name = "kde";
      # name = "adwaita";
      # package = [
      #   pkgs.adwaita-qt
      #   pkgs.adwaita-qt6
      # ];
    };
  };

  xdg.configFile."kdeglobals".source =
    "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";

  programs.gpg.enable = true;
  services.mpris-proxy.enable = true;

  programs.cargo = {
    enable = true;
    settings = {
      build = {
        rustc-wrapper = "sccache";
      };

      target = {
        "x86_64-unknown-linux-gnu" = {
          linker = "clang";
          rustflags = [ "-Clink-arg=--ld-path=${pkgs.wild}/bin/wild" ];
        };

        "aarch64-unknown-linux-gnu" = {
          linker = "${pkgs.pkgsCross.aarch64-multiplatform.buildPackages.gcc}/bin/gcc";
        };
      };
    };
  };

  services.syncthing = {
    enable = true;
  };
  # services.syncthing = {
  #   enable = true;
  #   dataDir = "/home/tom"; # Default folder for new synced folders
  #   configDir = "/home/tom/.config/syncthing"; # Folder for Syncthing's settings and keys
  # };

  # xdg.configFile = {
  #   "qt5ct/qt5ct.conf".text = ''
  #     [Appearance]
  #     custom_palette=false
  #     icon_theme=breeze-dark
  #     style=breeze
  #   '';
  #
  #   "qt6ct/qt6ct.conf".text = ''
  #     [Appearance]
  #     custom_palette=false
  #     icon_theme=breeze-dark
  #     style=breeze
  #   '';
  # };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";
}
