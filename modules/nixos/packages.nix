{ inputs, ... }:

{
  config.flake.nixosModules.packages =
    { pkgs, ... }:

    let
      system = pkgs.stdenv.hostPlatform.system;

      sforzando = pkgs.callPackage ../../packages/sforzando.nix { };
      mtpowerdrumkit = pkgs.callPackage ../../packages/mtpowerdrumkit.nix { };
      sitala = pkgs.callPackage ../../packages/sitala.nix { };
    in
    {
      environment.systemPackages = with pkgs; [
        vim
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
        libsForQt5.qtstyleplugin-kvantum
        kdePackages.qtstyleplugin-kvantum
        kdePackages.kirigami
        catppuccin-kvantum
        polkit_gnome
        yabridge
        yabridgectl
        wineWow64Packages.yabridge
        winetricks
        vital
        lsp-plugins
        calf
        inputs.zen-browser.packages.${system}.default
        inputs.yadal.packages.${system}.default
        inputs.tiddl.packages.${system}.default
        sforzando
        sitala
        mtpowerdrumkit
      ];

      systemd.tmpfiles.rules = [
        "L+ /opt/Plogue - - - - ${sforzando}/opt/Plogue"
        "L+ /run/current-system/sw/lib/vst3/MT-PowerDrumKit.vst3 - - - - /home/tom/VST/lib/vst3/MT-PowerDrumKit.vst3"
      ];
    };
}
