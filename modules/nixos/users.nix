{ pkgs, ... }:

{
  users.users.tom = {
    enable = true;
    isNormalUser = true;
    description = "Tomkoid";
    extraGroups = [
      "wheel"
      "input"
      "lock"
      "video"
      "audio"
      "networkmanager"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };
}
