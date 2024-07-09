{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    alacritty
    kitty
    foot
    wezterm
    zsh
    htop bottom
    libnotify
    polkit_gnome
    gnome-keyring
    gparted
    grim
    slurp
    swappy
    hyprshot
    hyprlock
    hyprpicker
    swappy
    swayidle
    swaylock
    sway-audio-idle-inhibit
    xss-lock
    unzip
    unrar
    brightnessctl
    vlc
    mpv
    playerctl
    hping
    zellij
    gnumake
    nodejs bun
    go
    nim nimble nimlangserver
    zig zls
    elixir erlang gleam
    rustup
    python3Full
    python311Packages.setuptools
    mold
    gcc clang clang-tools
    meson ninja
    sqlite
    wineWowPackages.stable

    # GNOME
    libadwaita
    adwaita-icon-theme

    # VIDEO
    ffmpeg
    # Video/Audio data composition framework tools like "gst-inspect", "gst-launch" ...
    gst_all_1.gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst_all_1.gst-plugins-base
    # Specialized plugins separated by quality
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst_all_1.gst-vaapi

    # LINUX
    linuxKernel.packages.linux_zen.cpupower
  ];
}
