preBuild_security_asn1() {
  substituteInPlace secasn1u.c \
    --replace 'subt = (* chooserp)(thing, encoding, buf, dest)' \
              'subt = (* chooserp)(thing, encoding, buf, strlen(buf), dest)'
}
