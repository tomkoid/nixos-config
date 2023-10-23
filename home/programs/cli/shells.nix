{ pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
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
