# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
  boot.kernelParams = [ "intel_pstate=active" ];
  boot.extraModulePackages = [ pkgs.linuxPackages_latest.v4l2loopback ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e2aa3c7e-45f0-40fe-ab72-f00fa8f9b77d";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-68d7bcb0-3b46-43ce-9080-06180317daea".device = "/dev/disk/by-uuid/68d7bcb0-3b46-43ce-9080-06180317daea";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/04C4-6CB0";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  hardware.graphics =
  let
    extraGpuPackages = with pkgs; [
      mesa.drivers
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  in
  {
    enable = true;
    enable32Bit = true;
    extraPackages = extraGpuPackages;
    extraPackages32 = extraGpuPackages;
  };

  environment.systemPackages = [
    pkgs.intel-gpu-tools
  ];

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024;
  }];

  # enable zram
  zramSwap = {
    enable = true;
  };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;


  services.power-profiles-daemon.enable = false;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
