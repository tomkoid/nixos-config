{
  config.flake.nixosModules.fonts =
    { pkgs, ... }:

    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        adwaita-fonts
        liberation_ttf
        fira-code
        google-fonts
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        nerd-fonts.iosevka
        nerd-fonts.jetbrains-mono
      ];
    };
}
