{ home, pkgs, inputs, config, username, system, ... }:

{
  home.packages = [
    pkgs.brave
    pkgs.librewolf
    pkgs.firefox
    pkgs.ungoogled-chromium
    inputs.thorium-browser.defaultPackage.${system}
  ];

  # for librewolf keepassxc integration
  home.file.".librewolf/native-messaging-hosts/org.keepassxc.keepassxc_browser.json".source = config.lib.file.mkOutOfStoreSymlink "/home/${username}/.mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json";
}
