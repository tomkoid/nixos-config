{ pkgs, ... }:

{
  imports = [
    ./auto-cpufreq.nix
    ./bluetooth.nix
    ./docker.nix
    ./firewall.nix
    ./flatpak.nix
    ./fwupd.nix
    ./podman.nix
    ./polkit.nix
    ./printing.nix
    ./sound.nix
    ./syncthing.nix
    ./udev.nix
    ./thermald.nix
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.udisks2.mountOnMedia = true;
  services.tor.enable = true;
  services.openssh.enable = true;
  programs.ssh.askPassword = "";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.blueman.enable = true;
}
