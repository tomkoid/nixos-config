{ myConfig, pkgs, ... }:

{
  imports = [
    ./auto-cpufreq.nix
    ./bluetooth.nix
    ./docker.nix
    ./displaymanager.nix
    ./firewall.nix
    ./flatpak.nix
    ./fwupd.nix
    ./podman.nix
    ./polkit.nix
    ./printing.nix
    ./sound.nix
    ./syncthing.nix
    ./thermald.nix
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tor.enable = true;
  services.openssh.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  services.blueman.enable = true;
}
