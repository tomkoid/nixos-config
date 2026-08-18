{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  pname = "sforzando";
  version = "1.982";

  # Ensure this matches the exact filename of your zip archive
  src = pkgs.fetchurl {
    url = "https://sforzando.s3.us-east-1.amazonaws.com/LINUX_plogue-sforzando_1.982_x86_64.zip";
    hash = "sha256-7ms1T9N1/50M4wgZaD9E07cSof5P9Tx35E3wNtqCqQA=";
  };

  nativeBuildInputs = with pkgs; [
    unzip
    dpkg
    autoPatchelfHook
  ];

  # Updated dependency names to fix the xorg deprecation warnings
  buildInputs = with pkgs; [
    alsa-lib
    freetype
    libGL
    libx11
    libxext
    libxcursor
    libxrandr
    glib
    stdenv.cc.cc.lib

    pango # libpango-1.0.so.0, libpangocairo-1.0.so.0
    cairo # libcairo.so.2
    fontconfig # libfontconfig.so.1
    curl # libcurl.so.4
    xcbutil # libxcb-util.so.1
    libxkbcommon # libxkbcommon-x11.so.0
    libpulseaudio # libpulse.so.0
    gtk3 # libgtk-3.so.0, libgdk-3.so.0
    gtkmm3 # libgtkmm-3.0.so.1, libgdkmm-3.0.so.1
    glibmm # libglibmm-2.4.so.1, libgiomm-2.4.so.1
    libsigcxx # libsigc-2.0.so.0
  ];

  # Nix automatically unzips the src and enters the folder during unpackPhase.
  # We extract the internal .deb files during the buildPhase.
  buildPhase = ''
    mkdir extracted
    for deb in *.deb; do
      echo "Extracting $deb..."
      dpkg-deb -x "$deb" extracted/
    done
  '';

  installPhase = ''
    mkdir -p $out/lib $out/share $out/bin $out/opt

    cd extracted

    # 1. Copy VST3 and CLAP plugins
    cp -r usr/lib/* $out/lib/

    # 2. Copy Desktop files, Docs, and Icons
    cp -r usr/share/* $out/share/

    # 3. Copy the ARIA Engine and Standalone data
    cp -r opt/Plogue $out/opt/

    # 4. Expose the standalone binary to the system PATH
    find $out/opt/Plogue -type f -executable -name "sforzando" -exec ln -s {} $out/bin/ \;
  '';
}
