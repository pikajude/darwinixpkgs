{ CommonCrypto, appleDerivation, libsecurity_codesigning, libsecurity_utilities, m4, osx_private_sdk }:
appleDerivation {
  buildInputs = [
    libsecurity_utilities
    m4
  ];
  NIX_CFLAGS_COMPILE = [
    "-Wno-shift-op-parentheses"
  ];
  patchPhase = ''
    unpackFile ${libsecurity_codesigning.src}
    mv libsecurity_codesigning*/lib security_codesigning
    substituteInPlace lib/handletemplates.h \
      --replace "state().findAllRefs" "state().template findAllRefs"
  '';
}
