{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  xdg.configFile."starship.toml".source = ../../config/starship/starship.toml;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  # Enable all if nushell
  programs.nushell = {
    enable = true;
    envFile.text = "";
    extraConfig = ''
      $env.config = {
      	show_banner: false,
      }

      def , [...packages] {
          nix shell ($packages | each {|s| $"nixpkgs#($s)"})
      }
    '';
  };
}
