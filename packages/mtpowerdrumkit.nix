{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  pname = "mt-power-drum-kit";
  version = "2.1.5";

  # Point to your local zip archive
  src = pkgs.fetchurl {
    url = "https://cdn1.resources.manda-audio.com/DOWNLOADS/products/mtpdk2_free/2.1.5/MTPDK-2.1.5.1-VST3-64bit-Linux-FULL.zip";
    hash = "sha256-lb8RuIdLgDC2y9KSF6hlWXWKlt4jI8tndWk/WVanpGo=";
  };

  nativeBuildInputs = with pkgs; [
    unzip
    autoPatchelfHook
  ];

  buildInputs = with pkgs; [
    stdenv.cc.cc.lib
    libx11
    xcbutil
    xcbutilcursor
    libxkbcommon
    glib
    cairo
    pango
    fontconfig
  ];

  installPhase = ''
    mkdir -p $out/lib/vst3/MT-PowerDrumKit.vst3
    cp -r . $out/lib/vst3/MT-PowerDrumKit.vst3
  '';
}
