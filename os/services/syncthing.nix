{ ... }:

{
  services.syncthing = {
    enable = true;
    dataDir = "/home/tom";
    openDefaultPorts = true;
    configDir = "/home/tom/.config/syncthing";
    user = "tom";
    group = "users";
    guiAddress = "127.0.0.1:8384";
  };
}
