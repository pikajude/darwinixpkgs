{ stdenv, fetchurl, callPackage, writeScriptBin }:

let
  libs = callPackage ./libs {
    src = fetchurl {
      url = "http://opensource.apple.com/tarballs/Security/Security-55471.14.tar.gz";
      sha256 = "09c4r53fc5v5c8p4aggbkm69hmag97ifm2xhw2sc57wb1xglczwv";
    };
  };
in

stdenv.lib.overrideDerivation (writeScriptBin "security" ''
  #!${stdenv.shell}

  cat ${import <_keychains>}
'') (drv: {
  __propagatedSandboxProfile = [ ''
    (allow mach-lookup
      (global-name "com.apple.SecurityServer")
      (global-name "com.apple.cfprefsd.daemon")
      (global-name "com.apple.system.opendirectoryd.membership")
      (global-name "com.apple.system.logger")
      (global-name "com.apple.bsd.dirhelper"))

    (allow file-read-metadata
      (literal "/private/var")
      (literal "/private/var/db")
      (subpath "/private/var/db/mds")
      (literal "/private/var/run/systemkeychaincheck.done")
      (literal "/etc"))

    (allow file-read*
      (subpath "/System/Library/Keychains"))

    (allow file*
      (subpath "/mds")
      (regex #"^/private/var/.*/mds"))
  '' ];
})

/* stdenv.mkDerivation rec {
  version = "55115";
  name = "SecurityTool-${version}";

  srcs = fetchurl {
    url = "http://opensource.apple.com/tarballs/SecurityTool/SecurityTool-${version}.tar.gz";
    sha256 = "0apcz4vy2z5645jhrs60wj3w27mncjjqv42h5lln36g6qs2n9113";
  };

  buildInputs = [ libs ];

  sourceRoot = name;

  patchPhase = ''
    runHook prePatch

    mkdir "$TMPDIR/Security"

    security_root="$(dirname "$PWD")/Security-55471.14"

    runHook postPatch
  '';

  buildPhase = ''
    runHook preBuild

    for file in *.c; do
      cc -c $file -o "$file.o"
    done

    for file in *.cpp; do
      c++ -c $file -o "$file.o"
    done

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    ld -macosx_version_min 10.7 -lSystem ${libs}/lib/libsecurity.dylib -lc++ \
      -framework Security -framework CoreFoundation \
      -o security_tool \
      *.o

    runHook postInstall
  '';

  NIX_CFLAGS_COMPILE = [
    "-DNDEBUG=1"
    "-Wmost" "-Wno-four-char-constants" "-Wno-unknown-pragmas"
    "-Wno-deprecated-declarations"
  ];

  __propagatedImpureHostDeps = [ "/System/Library/Keychains" ];

  propagatedSandboxProfile = ''
    (allow mach-lookup
      (global-name "com.apple.SecurityServer")
      (global-name "com.apple.cfprefsd.daemon"))

    (allow file-read-metadata
      (literal "/private/var")
      (literal "/private/var/db")
      (subpath "/private/var/db/mds")
      (literal "/private/var/run/systemkeychaincheck.done")
      (literal "/etc"))

    (allow file-write* (subpath "/mds"))
  '';

  meta = with stdenv.lib; {
    description = "Command line interface to Mac OS X keychains and Security framework";
    maintainers = with maintainers; [
      copumpkin
      joelteon
    ];
    platforms = platforms.darwin;
    license = licenses.apsl20;
  };
}
*/
