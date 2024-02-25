{ flakeDir, config, ... }:

{
  home.file = {
    ".config/amfora".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/amfora";
    ".config/cava".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/cava";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/fish";
    ".config/htop".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/htop";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/hypr";
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/kitty";
    ".config/mpd/mpd.conf".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/mpd/mpd.conf";
    ".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/mpv";
    ".config/picom".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/picom";
    ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/rofi";
    ".config/sway".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/sway";
    ".config/swaylock".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/swaylock";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/waybar";
    ".config/wluma".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/wluma";

    ".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/starship.toml";
  };
}
