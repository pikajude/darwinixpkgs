{ stdenv, lib, fetchFromGitHub, autoconf, automake, libtool, pkgconfig
, ApplicationServices, CoreServices }:

stdenv.mkDerivation rec {
  version = "1.10.1";
  name = "libuv-${version}";

  src = fetchFromGitHub {
    owner = "libuv";
    repo = "libuv";
    rev = "v${version}";
    sha256 = "0gna53fgsjjs38kv1g20xfaalv0fk3xncb6abga3saswrv283hx0";
  };

  postPatch = let
    toDisable = [
      "getnameinfo_basic" # probably network-dependent
      "spawn_setuid_fails" "spawn_setgid_fails" "fs_chown" # user namespaces
    ];
    tdRegexp = lib.concatStringsSep "\\|" toDisable;
    in lib.optionalString doCheck ''
      sed '/${tdRegexp}/d' -i test/test-list.h
    '';

  buildInputs = [ automake autoconf libtool pkgconfig ]
    ++ stdenv.lib.optionals stdenv.isDarwin [ ApplicationServices CoreServices ];

  frameworks = [ "ApplicationServices" "CoreServices" ];

  NIX_CFLAGS_COMPILE = [
    "-Wno-deprecated-declarations" "-Wno-nullability-extension" "-Wno-four-char-constants"
    "-Wno-c99-extensions" "-Wno-long-long" "-Wno-pedantic"
  ];

  preConfigure = ''
    LIBTOOLIZE=libtoolize ./autogen.sh
  '';

  enableParallelBuilding = true;

  doCheck = !stdenv.isDarwin;

  meta = with lib; {
    description = "A multi-platform support library with a focus on asynchronous I/O";
    homepage    = https://github.com/libuv/libuv;
    maintainers = with maintainers; [ cstrahan ];
    platforms   = with platforms; linux ++ darwin;
  };

}
