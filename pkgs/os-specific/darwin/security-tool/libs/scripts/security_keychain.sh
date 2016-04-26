preBuild_security_keychain() {
  NIX_CFLAGS_COMPILE+=" -isystem $(dirname "$PWD")/libDER -include xpc/private.h -include sandbox_private.h"

  substituteInPlace SecCFTypes.h \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace SecFrameworkP.c \
    --replace CoreFoundation/CFBundlePriv.h "$srcs_CF/CFBundlePriv.h" \
    --replace '<utilities/debugging.h>' "\"$TOP/utilities/src/debugging.h\""
  substituteInPlace SecCertificateP.c \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace SecCFWrappers.h \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace SecRandom.c \
    --replace '<CommonCrypto/CommonRandomSPI.h>' "\"$srcs_CommonCrypto/include/CommonRandomSPI.h\""
  substituteInPlace CertificateRequest.cpp \
    --replace 'dotMacTp.h' "$srcs_security_dotmac_tp/lib/dotMacTp.h"
  substituteInPlace Certificate.cpp \
    --replace '<CommonCrypto/CommonDigestSPI.h>' "\"$srcs_CommonCrypto/include/CommonDigestSPI.h\""
  substituteInPlace SecAccess.cpp \
    --replace '<utilities/SecCFWrappers.h>' "\"$TOP/utilities/src/SecCFWrappers.h\""

  for file in $(grep -Rl '<SecBase\.h>' .); do
    substituteInPlace "$file" --replace '<SecBase.h>' '"SecBase.h"'
  done

  sed -i -e '/extern CFStringRef kSecPropertyTypeDate/d' \
         -e '/extern CFStringRef kSecPropertyTypeURL/d' \
         -e '/extern CFStringRef kSecPropertyTypeData/d' \
         -e '/extern CFStringRef kSecPropertyKeyValue/d' \
         -e '/extern CFStringRef kSecPropertyKeyLocalizedLabel/d' \
         -e '/extern CFStringRef kSecPropertyKeyLabel/d' \
         -e '/extern CFStringRef kSecPropertyKeyType/d' \
         -e '/extern CFStringRef kSecPropertyTypeString/d' \
    CertificateValues.cpp

  sed -i '/extern CFTypeRef kSecPrivateKeyAttrs/d' SecKeyPriv.h
  sed -i '/extern CFTypeRef kSecPublicKeyAttrs/d' SecKeyPriv.h
}
