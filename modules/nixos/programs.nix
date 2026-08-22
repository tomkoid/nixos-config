{
  config.nixos.modules.programs =
    { pkgs, ... }:

    {
      programs.fish.enable = true;

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
      };
    };
}
