preBuild_securityd() {
  pushd ..
  make -f mig/mig.mk SRCROOT=. BUILT_PRODUCTS_DIR=. PROJECT_DIR=. DERIVED_SRC=lib
  popd

  NIX_CFLAGS_COMPILE+=" -Dmig_external= -I$srcs_securityd/src"
  cp $srcs_securityd/src/transition.cpp .

  ln -sv "$srcs_libsecurity_agent/lib" "$TMPDIR/security_agent_client"

  touch "$TMPDIR/securityd_dtrace.h"
}
