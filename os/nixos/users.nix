{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tom = {
    isNormalUser = true;
    description = "tom";
    extraGroups = [ "networkmanager" "wheel" "storage" "lock" "video" "libvirtd" ];
    # packages = with pkgs; [
    #   firefox
    #   thunderbird
    # ];
  };
}
