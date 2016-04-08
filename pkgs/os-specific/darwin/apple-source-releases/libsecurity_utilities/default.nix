{ IOKit, appleDerivation, apple_sdk, libauto, libobjc, libsecurity_codesigning,
osx_private_sdk, sqlite, stdenv, cf-private }:
appleDerivation {
  buildInputs = [
    libauto
    libobjc
    IOKit
    sqlite
    apple_sdk.frameworks.PCSC
  ];
  NIX_CFLAGS_COMPILE = [
    "-Wno-empty-body" "-Wno-mismatched-tags" "-Wno-unused-local-typedef"
    "-Wno-logical-op-parentheses" "-Wno-infinite-recursion" "-Wno-return-type"
    "-Wno-dangling-else" "-Wno-overloaded-virtual" "-Wno-parentheses"
    "-Wno-null-conversion"
  ];
  patchPhase = ''
    substituteInPlace lib/errors.h --replace \
      '<CoreServices/../Frameworks/CarbonCore.framework/Headers/MacTypes.h>' \
      '"MacTypes.h"'
    substituteInPlace lib/superblob.h --replace 'result->at' 'result->template at'
    substituteInPlace lib/debugging.cpp --replace PATH_MAX 1024
    substituteInPlace lib/vproc++.cpp --replace /usr/local/include/vproc_priv.h vproc_priv.h
    substituteInPlace lib/cfclass.h --replace "CoreFoundation/CFRuntime.h" "${./CFRuntime.h}"
    substituteInPlace lib/seccfobject.h --replace "CoreFoundation/CFRuntime.h" "${./CFRuntime.h}"
    substituteInPlace lib/powerwatch.h --replace "IOKit/pwr_mgt/IOPMLibPrivate.h" "${./IOPMLibPrivate.h}"
    substituteInPlace lib/osxcode.cpp --replace "CoreFoundation/CFBundlePriv.h" "${./CFBundlePriv.h}"
  '';
}
