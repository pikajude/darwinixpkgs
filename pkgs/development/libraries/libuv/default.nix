{ stdenv, lib, fetchFromGitHub, autoconf, automake, libtool, pkgconfig

, ApplicationServices, CoreServices }:

stdenv.mkDerivation rec {
  version = "1.9.1";
  name = "libuv-${version}";

  src = fetchFromGitHub {
    owner = "libuv";
    repo = "libuv";
    rev = "v${version}";
    sha256 = "1kc386gkkkymgz9diz1z4r8impcsmki5k88dsiasd6v9bfvq04cc";
  };

  buildInputs = [ automake autoconf libtool pkgconfig ]
    ++ stdenv.lib.optionals stdenv.isDarwin [ ApplicationServices CoreServices ];

  preConfigure = ''
    LIBTOOLIZE=libtoolize ./autogen.sh
  '';

      mkdir build/lib
      mv build/libuv.* build/lib

      pushd build/lib
      lib=$(basename libuv.*)
      ext="''${lib##*.}"
      mv $lib libuv.10.$ext
      ln -s libuv.10.$ext libuv.$ext
      popd
    '';
    installPhase = ''
      cp -r build $out
    '';
    inherit meta;
  };

  # for versions > 0.11.6
  mkWithAutotools = stability: version: sha256: stdenv.mkDerivation {
    name = mkName stability version;
    src = mkSrc version sha256;
    frameworks = [ "ApplicationServices" ];
    buildInputs = [ automake autoconf libtool pkgconfig ]
      ++ stdenv.lib.optionals stdenv.isDarwin [ ApplicationServices CoreServices ];
    preConfigure = ''
      LIBTOOLIZE=libtoolize ./autogen.sh
    '';
    inherit meta;
  };

}
