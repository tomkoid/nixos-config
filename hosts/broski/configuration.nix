# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  sforzando = (pkgs.callPackage ../../packages/sforzando.nix { });
  mtpowerdrumkit = (pkgs.callPackage ../../packages/mtpowerdrumkit.nix { });
  sitala = (pkgs.callPackage ../../packages/sitala.nix { });
  # fhsReaper = pkgs.buildFHSUserEnv {
  #   name = "reaper";
  #   targetPkgs =
  #     pkgs: with pkgs; [
  #       # Put all your standard audio, UI, and plugin dependencies here once
  #       alsa-lib
  #       freetype
  #       libGL
  #       libx11
  #       libxext
  #       libxcursor
  #       libxrandr
  #       fontconfig
  #       glib
  #       gtk3
  #       pango
  #       cairo
  #       curl
  #       libpulseaudio
  #       zlib
  #       stdenv.cc.cc.lib
  #     ];
  #   runScript = "reaper";
  # };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "broski"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true; # Required for yabridge/wine VST bridging
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tom = {
    enable = true;
    isNormalUser = true;
    description = "Tomkoid";
    extraGroups = [
      "wheel"
      "input"
      "lock"
      "video"
      "audio"
      "networkmanager"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

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

  services.displayManager.autoLogin = {
    enable = true;
    user = "tom";
  };
  services.displayManager.ly = {
    enable = true;
  };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.steam.enable = true;

  programs.hyprlock.enable = true;

  # programs.firefox.enable = true;
  programs.dconf.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    wget
    kitty
    quickshell
    noctalia-shell
    noctalia-qs
    fuzzel
    firefox
    git
    jujutsu
    gh
    chezmoi
    starship
    zoxide
    eza
    tealdeer
    fzf
    ripgrep
    nixd
    nixfmt
    gnome-keyring
    lua-language-server
    zellij
    yazi
    fastfetch
    brightnessctl
    pamixer
    alsa-utils
    acpi
    stylua
    vulkan-tools
    bottom
    networkmanagerapplet
    glib
    ffmpeg-full
    direnv
    uwsm
    github-copilot-cli
    delta
    copilot-language-server
    codex
    gcc
    cargo
    rustc
    clang
    sccache
    wild
    (reaper.override {
      jackLibrary = pipewire.jack;
    })
    qpwgraph
    pavucontrol
    pipewire.jack
    linuxPackages.cpupower
    linuxPackages.turbostat
    powertop
    powerstat
    inkscape
    easyeffects
    gimp
    nautilus
    keepassxc
    feishin
    tidal-hifi
    mpv
    tree-sitter
    prismlauncher
    hypridle
    vesktop
    adwaita-icon-theme
    qt6Packages.qt6ct
    libsForQt5.qt5ct
    kdePackages.breeze
    kdePackages.plasma-integration
    kdePackages.breeze-icons
    adwaita-qt
    adwaita-qt6
    noctalia-shell
    # wineWow64Packages.yabridge
    libsForQt5.qtstyleplugin-kvantum # For Qt5 apps
    kdePackages.qtstyleplugin-kvantum # For Qt6 / Plasma 6 apps (if applicable)
    kdePackages.kirigami # For Qt6 / Plasma 6 apps (if applicable)
    catppuccin-kvantum
    vesktop
    polkit_gnome
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.yadal.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.tiddl.packages.${pkgs.stdenv.hostPlatform.system}.default

    yabridge
    yabridgectl
    wineWow64Packages.yabridge
    winetricks
    vital
    sforzando
    sitala
    mtpowerdrumkit
    lsp-plugins
    calf
  ];

  systemd.tmpfiles.rules = [
    "L+ /opt/Plogue - - - - ${sforzando}/opt/Plogue"
    "L+ /run/current-system/sw/lib/vst3/MT-PowerDrumKit.vst3 - - - - /home/tom/VST/lib/vst3/MT-PowerDrumKit.vst3"
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    adwaita-fonts
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
  ];

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # services.syncthing = {
  #   enable = true;
  #   openDefaultPorts = true;
  # };

  services.keyd = {
    enable = true;
    keyboards = {
      externalKeyboard = {
        ids = [ "0001:0001:6fb3735a" ];
        settings = {
          main = {
            capslock = "esc";
            esc = "capslock";
          };
        };
      };
    };
  };

  services.gvfs = {
    enable = true;
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true; # Optional: use GPG for SSH auth
    pinentryPackage = pkgs.pinentry-qt; # Or pinentry-curses / pinentry-gnome3
  };

  services.upower.enable = true;

  # musnix = {
  #   enable = true;
  # };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Standard GUI / X11 / Wayland dependencies
    stdenv.cc.cc.lib
    alsa-lib
    freetype
    libGL
    libx11
    libxext
    libxcursor
    libxrandr
    libxi
    libxinerama
    fontconfig
    glib
    gtk3
    pango
    cairo
    curl
    libpulseaudio
    zlib

    xcbutil # libxcb-util.so.1
    libxkbcommon # libxkbcommon-x11.so.0
    gtkmm3 # libgtkmm-3.0.so.1, libgdkmm-3.0.so.1
    glibmm # libglibmm-2.4.so.1, libgiomm-2.4.so.1
    libsigcxx # libsigc-2.0.so.0
  ];

  # security.pam.loginLimits = [
  #   {
  #     domain = "@audio";
  #     item = "memlock";
  #     type = "-";
  #     value = "unlimited";
  #   }
  #   {
  #     domain = "@audio";
  #     item = "rtprio";
  #     type = "-";
  #     value = "99";
  #   }
  #   {
  #     domain = "@audio";
  #     item = "nofile";
  #     type = "soft";
  #     value = "99999";
  #   }
  #   {
  #     domain = "@audio";
  #     item = "nofile";
  #     type = "hard";
  #     value = "99999";
  #   }
  # ];

  security.rtkit.enable = true;
  services.fprintd.enable = true;

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

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "99";
    }
    {
      domain = "@audio";
      item = "nice";
      type = "-";
      value = "-19";
    }
  ];

  services.udev.extraRules = ''
    KERNEL=="rtc0", GROUP="audio"
    KERNEL=="hpet", GROUP="audio"
  '';

  environment.variables =
    let
      makePluginPath =
        format:
        (pkgs.lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ])
        + ":$HOME/.${format}";
    in
    {
      LV2_PATH = makePluginPath "lv2";
      VST3_PATH = makePluginPath "vst3";
      CLAP_PATH = makePluginPath "clap";
    };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    8384
    22000
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      # Required so non-root users are allowed to use the above substituter/keys.
      # Use @wheel for all sudo users, or list your username explicitly.
      trusted-users = [
        "root"
        "@wheel"
      ];

    };

    gc = {
      automatic = true;
      dates = "weekly"; # Or a specific time like "03:15"
      options = "--delete-older-than 30d";
    };
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
