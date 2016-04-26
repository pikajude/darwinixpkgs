source $stdenv/setup

for file in "$(dirname "$0")"/*.sh; do
  if [ "$0" != "$file" ]; then
    echo "sourcing $file"
    source "$file"
  fi
done

postUnpack() {
  for libdir in Security-*/libs*; do
    libbase="$(basename "$libdir")"
    mkdir -p "$TMPDIR/$libbase/fake-include"
    srcdir="$PWD/$libdir/lib"
    ln -sv "$srcdir" "$TMPDIR/${libbase#lib}"
    ln -sv "$srcdir" "$TMPDIR/$libbase/fake-include/Security"
    NIX_CFLAGS_COMPILE+=" -isystem $TMPDIR/$libbase/fake-include"
  done
  ln -sv "$TMPDIR/securityd" "$TMPDIR/securityd_client"
  NIX_CFLAGS_COMPILE+=" -isystem $TMPDIR"
  export TOP="$(echo "$PWD"/Security-*)"
}

buildPhase() {
  runHook preBuild

  for lib in $LIBS; do
    if [ -d "lib$lib/lib" ]; then
      pushd "lib$lib/lib"
    else
      pushd "$lib"
    fi

    OLD_CFLAGS="$NIX_CFLAGS_COMPILE"

    echo "preBuild_$lib"
    if [ "$(type -t "preBuild_$lib")" ]; then
      runHook "preBuild_$lib"
    fi

    OBJS=

    for file in *.c *.cc *.cpp; do
      OBJS+=" ${file}.o"
    done

    make -f $maker "OBJS=$OBJS" -j$NIX_BUILD_CORES

    NIX_CFLAGS_COMPILE="$OLD_CFLAGS"

    popd
  done

  ld -macosx_version_min 10.7 -arch x86_64 -dylib -o libsecurity.dylib \
    -lSystem -lOpenScriptingUtil -lantlr -lauto -lbsm -lc++ -lobjc -lsqlite3 -lxar \
    -framework CoreFoundation -framework IOKit -framework PCSC -framework Security -framework System \
    $(find . -name '*.o')

  runHook postBuild
}

installPhase() {
  runHook preInstall

  mkdir -p $out/lib
  install -m 0644 libsecurity.dylib $out/lib/libsecurity.dylib

  for lib in $LIBS; do
    mkdir -p "$out/include/$lib"
    if [ -d "lib$lib" ]; then
      install -m 0755 "lib$lib"/lib/*.h "$out/include/$lib/"
    else
      install -m 0755 "$lib"/*.h "$out/include/$lib/"
    fi
  done

  mkdir -p "$out/include/Security"
  ln -sfv "$out/include"/*/*.h "$out/include/Security/"

  cp "libsecurity_keychain/lib"/Sec*Priv.h "$out/include/Security/"
  cp "libsecurity_keychain/lib"/SecKeychainItemExtendedAttributes.h "$out/include/Security/"
  cp "libsecurity_keychain/lib"/TrustSettingsSchema.h "$out/include/Security/"
  cp "libsecurity_mds/lib/mdspriv.h" "$out/include/Security/"

  runHook postInstall
}

preBuild_security_authorization() {
  NIX_CFLAGS_COMPILE+=" -isystem $TOP/authd"
}

preBuild_security_cdsa_utilities() {
  echo hi
}

preBuild_security_codesigning() {
  cat >codesigning_dtrace.h <<EOF
#define CODESIGN_ALLOCATE_WRITE(...)
#define CODESIGN_ALLOCATE_ARCH(...)
#define CODESIGN_ALLOCATE_ARCHN(...)
#define CODESIGN_ALLOCATE_VALIDATE(...)
#define CODESIGN_DISKREP_CREATE_CFM(...)
#define CODESIGN_DISKREP_CREATE_KERNEL(...)
#define CODESIGN_DISKREP_CREATE_MACHO(...)
#define CODESIGN_DISKREP_CREATE_SLC(...)
#define CODESIGN_SIGN_DEP_INTERP(...)
#define CODESIGN_DISKREP_DESTROY(...)
#define CODESIGN_DISKREP_CREATE_FILE(...)
#define CODESIGN_GUEST_HOSTINGPORT(...)
#define CODESIGN_GUEST_CDHASH_GENERIC(...)
#define CODESIGN_GUEST_IDENTIFY_GENERIC(...)
#define CODESIGN_GUEST_LOCATE_GENERIC(...)
#define CODESIGN_GUEST_IDENTIFY_PROCESS(...)
#define CODESIGN_GUEST_CDHASH_PROCESS(...)
#define CODESIGN_DISKREP_CREATE_BUNDLE_PATH(...)
#define CODESIGN_DISKREP_CREATE_DETACHED(...)
#define CODESIGN_DISKREP_CREATE_BUNDLE_REF(...)
#define CODESIGN_DYNAMIC_CREATE(...)
#define CODESIGN_EVAL_DYNAMIC_ROOT(...)
#define CODESIGN_EVAL_DYNAMIC_START_ENABLED(...) 1
#define CODESIGN_EVAL_DYNAMIC_START(...)
#define CODESIGN_EVAL_DYNAMIC_END(...)
#define CODESIGN_EVAL_STATIC_EXECUTABLE_END(...)
#define CODESIGN_EVAL_STATIC_EXECUTABLE_FAIL(...)
#define CODESIGN_EVAL_STATIC_EXECUTABLE_START(...)
#define CODESIGN_EVAL_STATIC_EXECUTABLE_START_ENABLED(...) 1
#define CODESIGN_EVAL_STATIC_RESOURCES_START_ENABLED() 1
#define CODESIGN_EVAL_STATIC_RESOURCES_START(...)
#define CODESIGN_EVAL_STATIC_RESOURCES_END(...)
#define CODESIGN_EVAL_STATIC_SIGNATURE_START(...)
#define CODESIGN_EVAL_STATIC_SIGNATURE_START_ENABLED(...) 1
#define CODESIGN_EVAL_STATIC_SIGNATURE_ADHOC(...)
#define CODESIGN_EVAL_STATIC_DIRECTORY(...)
#define CODESIGN_EVAL_REQINT_FRAGMENT_HIT(...)
#define CODESIGN_EVAL_REQINT_FRAGMENT_LOAD(...)
#define CODESIGN_EVAL_REQINT_FRAGMENT_LOAD_ENABLED(...) 1
#define CODESIGN_STATIC_CDHASH(...)
#define CODESIGN_EVAL_STATIC_RESET(...)
#define CODESIGN_STATIC_ATTACH_SYSTEM(...)
#define CODESIGN_STATIC_ATTACH_EXPLICIT(...)
#define CODESIGN_STATIC_CREATE(...)
#define CODESIGN_EVAL_STATIC_SIGNATURE_END(...)
#define CODESIGN_EVAL_STATIC_SIGNATURE_RESULT(...)
#define CODESIGN_EVAL_STATIC_SIGNATURE_EXPIRED(...)
#define CODESIGN_EVAL_STATIC_INTREQ_START_ENABLED() 1
#define CODESIGN_EVAL_STATIC_INTREQ_START(...)
#define CODESIGN_EVAL_STATIC_INTREQ_END(...)
#define CODESIGN_EVAL_STATIC_START_ENABLED(...) 1
#define CODESIGN_EVAL_STATIC_START(...)
#define CODESIGN_EVAL_STATIC_END(...)
#define CODESIGN_EVAL_REQINT_OP(...)
#define CODESIGN_EVAL_REQINT_START(...)
#define CODESIGN_EVAL_REQINT_END(...)
#define CODESIGN_EVAL_REQINT_UNKNOWN_FALSE(...)
#define CODESIGN_EVAL_REQINT_UNKNOWN_SKIPPED(...)
#define CODESIGN_LOAD_ANTLR(...)
#define SYSPOLICY_ASSESS_API(...)
#define SYSPOLICY_ASSESS_LOCAL(...)
#define SYSPOLICY_ASSESS_REMOTE(...)
#define SYSPOLICY_ASSESS_CACHE_HIT(...)
#define SYSPOLICY_ASSESS_OUTCOME_ACCEPT(...)
#define SYSPOLICY_ASSESS_OUTCOME_DEFAULT(...)
#define SYSPOLICY_RECORDER_MODE_ADHOC_PATH(...)
#define SYSPOLICY_ASSESS_OUTCOME_UNSIGNED(...)
#define SYSPOLICY_RECORDER_MODE(...)
#define SYSPOLICY_ASSESS_OUTCOME_BROKEN(...)
#define SYSPOLICY_ASSESS_OUTCOME_BROKEN_ENABLED(...) 1
#define SYSPOLICY_ASSESS_OUTCOME_ACCEPT_ENABLED(...) 1
#define SYSPOLICY_ASSESS_OUTCOME_DENY_ENABLED(...) 1
#define SYSPOLICY_ASSESS_OUTCOME_UNSIGNED_ENABLED(...) 1
#define SYSPOLICY_ASSESS_OUTCOME_DEFAULT_ENABLED(...) 1
#define SYSPOLICY_ASSESS_OUTCOME_DENY(...)
#define SYSPOLICY_RECORDER_MODE_ENABLED(...) 1
EOF

  cat >esp.h <<EOF
extern "C" {
  int __esp_enabled(void);
  OSStatus __esp_check_ns(const char*, void*);
  void __esp_notify_ns(const char*, void*);
}
EOF

  cat >quarantine.h <<EOF
typedef struct _qtn_file_s *qtn_file_t;
uint32_t _qtn_file_get_flags(qtn_file_t);

#define qtn_file_get_flags _qtn_file_get_flags

uint32_t _qtn_file_apply_to_fd(qtn_file_t, int);
uint32_t _qtn_file_apply_to_path(qtn_file_t, const char*);
uint32_t _qtn_file_set_flags(qtn_file_t, int);
uint32_t _qtn_file_init_with_fd(qtn_file_t, int);
uint32_t _qtn_file_init_with_path(qtn_file_t, const char*);

#define qtn_file_set_flags _qtn_file_set_flags
#define qtn_file_apply_to_fd _qtn_file_apply_to_fd
#define qtn_file_apply_to_path _qtn_file_apply_to_path
#define qtn_file_init_with_fd _qtn_file_init_with_fd
#define qtn_file_init_with_path _qtn_file_init_with_path

qtn_file_t _qtn_file_alloc();

#define qtn_file_alloc _qtn_file_alloc

void _qtn_file_free(qtn_file_t);

#define qtn_file_free _qtn_file_free

#define QTN_FLAG_ASSESSMENT_OK 1
#define QTN_FLAG_HARD 1
#define QTN_NOT_QUARANTINED 1

#define kLSDownloadRiskCategoryKey NULL
#define kLSRiskCategorySafe NULL
#define kLSRiskCategoryNeutral NULL
#define kLSRiskCategoryUnknown NULL
#define kLSRiskCategoryMayContainUnsafeExecutable NULL
EOF

  cat >CoreServicesPriv.h <<EOF

EOF

  cat >OpenScriptingUtilPriv.h <<EOF
extern bool OSAIsRecognizedExecutableURL(CFURLRef, int*);
EOF

  sed '/kSecCodeSignatureHashSHA1\t/d' -i CSCommonPriv.h
  sed '/kSecCodeSignatureHashSHA256\t/d' -i CSCommonPriv.h
  sed '/kSecCodeSignatureNoHash\t/d' -i CSCommonPriv.h

  substituteInPlace SecTask.c \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h" \
    --replace System/sys/codesign.h "$srcs_xnu/bsd/sys/codesign.h"
  substituteInPlace SecAssessment.cpp \
    --replace CoreFoundation/CFRuntime.h "$srcs_CF/CFRuntime.h"
  substituteInPlace cscdefs.h --replace '<esp.h>' '"esp.h"'
  substituteInPlace SecAssessment.cpp --replace '<esp.h>' '"esp.h"'
  substituteInPlace bundlediskrep.cpp \
    --replace CoreFoundation/CFBundlePriv.h "$srcs_CF/CFBundlePriv.h"
  substituteInPlace signer.cpp \
    --replace CoreFoundation/CFBundlePriv.h "$srcs_CF/CFBundlePriv.h"
  substituteInPlace diskrep.cpp \
    --replace CoreFoundation/CFBundlePriv.h "$srcs_CF/CFBundlePriv.h"
  substituteInPlace cskernel.cpp \
    --replace sys/codesign.h "$srcs_xnu/bsd/sys/codesign.h"
  substituteInPlace signerutils.cpp \
    --replace sys/codesign.h "$srcs_xnu/bsd/sys/codesign.h"
  substituteInPlace csprocess.cpp \
    --replace System/sys/codesign.h "$srcs_xnu/bsd/sys/codesign.h"
  substituteInPlace piddiskrep.cpp \
    --replace System/sys/codesign.h "$srcs_xnu/bsd/sys/codesign.h"
  substituteInPlace quarantine++.h \
    --replace '<quarantine.h>' '"quarantine.h"'
  substituteInPlace policyengine.cpp \
    --replace '<CoreServices/CoreServicesPriv.h>' '"CoreServicesPriv.h"'
  substituteInPlace policyengine.cpp \
    --replace '<OpenScriptingUtilPriv.h>' '"OpenScriptingUtilPriv.h"'

  NIX_CFLAGS_COMPILE+=" -I$(dirname "$PWD")/antlr2"
}

genericBuild
