{ stdenv, fetchzip, openjdk, libzen, makeWrapper }:

stdenv.mkDerivation rec {
  version = "4.7";
  name = "filebot";
  src = fetchzip {
    url = "mirror://sourceforge/filebot/FileBot_${version}-portable.zip";
    sha256 = "0334vjn4p1jf1xwyzzyxy1f4kdra0zms92gqm9s8iq2d5fsk6w7c";
    stripRoot = false;
  };
  buildInputs = [ makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp $src/* $out/bin
    cd $out/bin
    sed -i 's,^APP_ROOT.*,APP_ROOT=/tmp,' filebot.sh
    substituteInPlace filebot.sh \
      --replace '$APP_ROOT/FileBot.jar' "$out/bin/FileBot.jar" \
      --replace java "${openjdk}/bin/java"
    mv filebot.sh filebot
    wrapProgram $out/bin/filebot --set LD_LIBRARY_PATH "${libzen}/lib"
  '';
}
