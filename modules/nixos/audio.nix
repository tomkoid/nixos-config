{ inputs, ... }:

{
  config.flake.nixosModules.audio =
    { lib, pkgs, ... }:

    let
      makePluginPath =
        format:
        lib.makeSearchPath format [
          "$HOME/.nix-profile/lib"
          "/run/current-system/sw/lib"
          "/etc/profiles/per-user/$USER/lib"
        ]
        + ":$HOME/.${format}";
    in
    {
      imports = [ inputs.musnix.nixosModules.musnix ];

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
      };

      security.rtkit.enable = true;

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

      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
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
          xcbutil
          libxkbcommon
          gtkmm3
          glibmm
          libsigcxx
        ];
      };

      environment.variables = {
        LV2_PATH = makePluginPath "lv2";
        VST3_PATH = makePluginPath "vst3";
        CLAP_PATH = makePluginPath "clap";
      };
    };
}
