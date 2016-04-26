preBuild_authd() {
  NIX_CFLAGS_COMPILE+=" -include authtypes.h -include authd_private.h -include object.h -include sandbox_private.h -include require.h -include $sqlite/include/sqlite3.h"
  NIX_CFLAGS_COMPILE+=" -DSQLITE_TRUNCATE_DATABASE=101 -DSQLITE_REPLACE_DATABASE=102 -DSQLITE_TRUNCATE_AUTOVACUUM_FULL=8 -DSQLITE_TRUNCATE_JOURNALMODE_WAL=1"

  substituteInPlace agent.c \
    --replace bootstrap_priv.h "$srcs_launchd/liblaunch/bootstrap_priv.h"
  substituteInPlace object.h \
    --replace '<CoreFoundation/CFRuntime.h>' "\"$srcs_CF/CFRuntime.h\""
  substituteInPlace authtoken.c \
    --replace '<CommonCrypto/CommonRandomSPI.h>' "\"$srcs_CommonCrypto/include/CommonRandomSPI.h\""
  substituteInPlace credential.c \
    --replace '<membershipPriv.h>' "\"$srcs_Libinfo/membership.subproj/membershipPriv.h\""
  substituteInPlace server.c \
    --replace IOKit/pwr_mgt/IOPMLibPrivate.h "$srcs_IOKitUser/pwr_mgt.subproj/IOPMLibPrivate.h"

  mkdir -p "$TMPDIR/corecrypto"
  ln -sv "$srcs_xnu/EXTERNAL_HEADERS/corecrypto"/*.h "$TMPDIR/corecrypto"
  cat >"$TMPDIR/corecrypto/ccdrbg.h" <<EOF
#ifndef _CORECRYPTO_CCDRBD_SYSTEM_H_
#define _CORECRYPTO_CCDRBD_SYSTEM_H_

struct ccdrbg_info;
struct ccdrbg_state;
struct ccdrbg_nistctr_custom;/* {
    ecb;
    int keylen;
    int strictFIPS;
    int use_df;
};*/

#endif
EOF

  sed -i '/sqlite3_private/d' authdb.c
  cat >require.h <<EOF
#define require(x,y) if(!(x)) { goto y; }
#define require_action(x,y,z) require(x,y)
#define require_noerr_action require_action
#define require_noerr require
#define check(x)
EOF
}
