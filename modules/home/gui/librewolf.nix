{ lib, config, mainUser, ... }:

{
  options = {
    myConfig.librewolf.enable = lib.mkEnableOption "enable gtk theming";
  };

  config = lib.mkIf config.myConfig.librewolf.enable {
    programs.librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "general.useragent.compatMode.firefox" = true;
      };

    };

    # for librewolf keepassxc integration
    home.file.".librewolf/native-messaging-hosts/org.keepassxc.keepassxc_browser.json".source = config.lib.file.mkOutOfStoreSymlink "/home/${mainUser}/.mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json";
  };
}
