{ pkgs, ... }:

{
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      font-awesome
      corefonts # Microsoft free fonts
      dejavu_fonts
      dina-font
      cantarell-fonts
      fira
      fira-mono
      fira-code-symbols
      freefont_ttf
      liberation_ttf
      line-awesome
      google-fonts
      inconsolata # monospaced
      libertine
      mononoki
      mplus-outline-fonts.githubRelease
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      open-dyslexic
      open-fonts
      open-sans
      roboto-mono
      roboto-serif
      overpass
      oxygenfonts
      powerline-fonts
      proggyfonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      swaycons
      ttf_bitstream_vera
      ubuntu_font_family # Ubuntu fonts
      unifont # some international languages
      vazir-fonts
      jetbrains-mono
      nerdfonts
    ];
    fontconfig = {
      cache32Bit = true;
      defaultFonts = {
        serif = [ "Noto Serif" "Cantarell" "Ubuntu" ];
        sansSerif = [ "Noto Sans" "Cantarell" "Ubuntu" ];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };
}
