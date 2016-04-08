{ stdenv, appleDerivation, libdispatch, Libsystem }:

appleDerivation {
  # these are included in the pure libc
  buildInputs = stdenv.lib.optionals stdenv.cc.nativeLibc [ libdispatch Libsystem ];

  buildPhase = ''
    cp ${./auto_dtrace.h} ./auto_dtrace.h
  '';

  installPhase = ''
    mkdir -p $out/include
    cp auto_zone.h auto_weak.h auto_tester/auto_tester.h auto_gdb_interface.h $out/include
  '';
}
