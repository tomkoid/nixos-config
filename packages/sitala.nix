{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  xorg,
  freetype,
  alsa-lib,
  libglvnd,
}:

stdenv.mkDerivation rec {
  pname = "sitala";
  version = "1.0";

  # Replace with the actual URL to the Sitala .deb file
  src = fetchurl {
    url = "https://decomposer.de/sitala/releases/sitala-${version}_amd64.deb";

    # Leave this as fakeSha256 initially.
    # Nix will fail on the first run and output the correct hash. Replace it here.
    sha256 = "sha256-21BIJm8ZdGyHOxR65PAIjUkHUHSbq/3xS89ArbUc4zM=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
  ];

  buildInputs = [
    xorg.libX11
    xorg.libXext
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXrandr
    freetype
    alsa-lib
    libglvnd
    stdenv.cc.cc.lib
  ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/lib/lxvst
    mkdir -p $out/share
    ls -lah usr/bin

    cp usr/bin/sitala $out/bin/sitala

    cp usr/lib/lxvst/libsitala.so $out/lib/lxvst/

    if [ -d usr/share ]; then
      cp -r usr/share/* $out/share/
    fi
  '';

  preFixup = ''
    patchelf --remove-needed libcurl-gnutls.so.4 $out/bin/sitala
    patchelf --remove-needed libcurl-gnutls.so.4 $out/lib/lxvst/libsitala.so
  '';

  meta = with lib; {
    description = "Sitala Drum Sampler Plugin";
    homepage = "https://decomposer.de/sitala/";
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
