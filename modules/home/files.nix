{ flakeDir, config, ... }:

{

  home.file.".config/amfora".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/amfora";
  home.file.".config/cava".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/cava";
  home.file.".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/fish";
  home.file.".config/htop".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/htop";
  home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/hypr";
  home.file.".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/kitty";
  home.file.".config/mpd/mpd.conf".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/mpd/mpd.conf";
  home.file.".config/mpv".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/mpv";
  home.file.".config/picom".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/picom";
  home.file.".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/rofi";
  home.file.".config/sway".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/sway";
  home.file.".config/swaylock".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/swaylock";
  home.file.".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/waybar";
  home.file.".config/wluma".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/wluma";

  home.file.".config/starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/config/starship.toml";
}
