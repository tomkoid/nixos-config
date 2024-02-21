{ pkgs, ... }:

{
  services.udev = {
    enable = true;
    # extraRules = ''
    # ACTION=="add", SUBSYSTEMS=="usb", SUBSYSTEM=="block", ENV{ID_FS_USAGE}=="filesystem", RUN{program}+="${pkgs.systemdMinimal}/bin/systemd-mount --no-block --automount=yes --collect $devnode /media"
    # '';
    packages = [
      pkgs.android-tools
    ];
  };
}
