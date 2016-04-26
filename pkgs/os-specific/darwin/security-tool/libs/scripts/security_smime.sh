preBuild_security_smime() {
  substituteInPlace cmssigdata.c \
    --replace '<CommonCrypto/CommonRandomSPI.h>' "\"$srcs_CommonCrypto/include/CommonRandomSPI.h\""

  substituteInPlace tsaTemplates.c \
    --replace SecCmsContentInfoTemplate cmsSimpleContentInfoTemplate

  sed -i -e '/extern CFTypeRef kSecPrivateKeyAttrs/d' \
         -e '/extern CFTypeRef kSecPublicKeyAttrs/d' \
    "$TOP/libsecurity_keychain/lib/SecKeyPriv.h"
}
