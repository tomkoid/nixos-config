{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "JetBrains Mono 10";
        offset = "7x60";
        progress_bar = true;
        sort = true;
        format = "%s %p\\n%b";
        alignment = "left";
        browser = "${pkgs.librewolf}/bin/librewolf";
        corner_radius = 7;
        follow = "keyboard";
      };

      urgency_low = {
        background = "#181926";
        foreground = "#8aadf4";
        timeout = 10;
      };

      urgency_normal = {
        background = "#181926";
        foreground = "#c6a0f6";
        timeout = 10;
      };

      urgency_critical = {
        background = "#181926";
        foreground = "#c6a0f6";
        timeout = 10;
      };
    };
  };
}
