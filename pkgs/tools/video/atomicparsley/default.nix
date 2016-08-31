{ stdenv, pkgs, fetchurl }:

stdenv.mkDerivation rec {
  name = "atomicparsley-${version}";
  product = "AtomicParsley";
  version = "0.9.0";

  src = fetchurl {
    url = "mirror://sourceforge/atomicparsley/${product}-source-${version}.zip";
    sha256 = "de83f219f95e6fe59099b277e3ced86f0430ad9468e845783092821dff15a72e";
  };

  buildInputs = with pkgs; [ unzip ];
  patches = [ ./casts.patch ];
  setSourceRoot = "sourceRoot=${product}-source-${version}";
  buildPhase = "bash build";
  installPhase = "install -D AtomicParsley $out/bin/AtomicParsley";

  frameworks = [ "Cocoa" ];

  postPatch = ''
    substituteInPlace build \
      --replace g++ c++
    substituteInPlace AP_NSImage.mm \
      --replace _NSBitmapImageFileType NSBitmapImageFileType \
      --replace 'char* suffix' 'const char* suffix'
    substituteInPlace AP_NSFile_utils.mm \
      --replace 'char* output_suffix' 'const char* output_suffix' \
      --replace 'char* input_suffix' 'const char* input_suffix'
  '';

  meta = with stdenv.lib; {
    description = ''
      A lightweight command line program for reading, parsing and
      setting metadata into MPEG-4 files
    '';

    homepage = http://atomicparsley.sourceforge.net/;
    license = licenses.gpl2;
    platforms = platforms.unix;
    maintainers = with maintainers; [ pjones ];
  };
}
