{ args, libs }:

let srcs = import ./srcs.nix { inherit (args) fetchzip; };

in

rec {
  xpcPrivate = args.runCommand "xpc-private" {} ''
    mkdir -p $out/include/xpc $out/include/CoreFoundation
    cat >$out/include/xpc/private.h <<EOF
    #include <xpc/xpc.h>
    extern void xpc_connection_set_target_uid(xpc_connection_t, uid_t);
    extern void xpc_connection_set_instance(xpc_connection_t, uuid_t);
    extern void xpc_dictionary_set_mach_send(xpc_object_t, const char*, mach_port_t);
    EOF
    cat >$out/include/CoreFoundation/CFXPCBridge.h <<EOF
    extern CFTypeRef _CFXPCCreateCFObjectFromXPCObject(xpc_object_t);
    extern xpc_object_t _CFXPCCreateXPCObjectFromCFObject(CFTypeRef);
    EOF
  '';

  libsecurity_authorization = attrs: attrs // {
    nativeBuildInputs = [ xpcPrivate ] ++
      [ libs.libsecurity_utilities libs.libsecurity_cdsa_utilities ];
    preBuild = ''
      NIX_CFLAGS_COMPILE+=" -I$(dirname "$PWD")/authd"
    '';
    patchPhase = ''
      substituteInPlace lib/Authorization.c \
        --replace '<Security/AuthorizationPriv.h>' '"AuthorizationPriv.h"' \
        --replace '<Security/AuthorizationTagsPriv.h>' '"AuthorizationTagsPriv.h"'
      substituteInPlace lib/Authorization.cpp \
        --replace '<Security/AuthorizationPriv.h>' '"AuthorizationPriv.h"' \
        --replace '<Security/AuthorizationTagsPriv.h>' '"AuthorizationTagsPriv.h"'
    '';
  };

  libsecurity_cdsa_client = attrs: attrs // {
    nativeBuildInputs = [ libs.libsecurity_cdsa_utilities ];
  };

  libsecurity_cdsa_utilities = attrs: attrs // {
    nativeBuildInputs = [ libs.libsecurity_utilities libs.libsecurity_codesigning ];
    patchPhase = ''
      ln -sv "$TOP/libsecurity_codesigning/lib" "$TMPDIR/security_codesigning"
      ln -sv "$TMPDIR/security_codesigning" "$TMPDIR/Security"

      # constant redefinition
      sed -i '/kSecCodeSignatureNoHash/d' "$TMPDIR/Security/CSCommonPriv.h"
      sed -i '/kSecCodeSignatureHashSHA1/d' "$TMPDIR/Security/CSCommonPriv.h"
      sed -i '/kSecCodeSignatureHashSHA256/d' "$TMPDIR/Security/CSCommonPriv.h"

      substituteInPlace lib/AuthorizationData.cpp \
        --replace '<Security/checkpw.h>' "\"$TOP/libsecurity_checkpw/lib/checkpw.h\""
    '';
    NIX_LDFLAGS = ''
      -lc++ -lsecurity_codesigning -lsecurity_utilities -framework CoreFoundation -framework Security
    '';
  };

  libsecurity_codesigning = attrs: attrs // {
    nativeBuildInputs = [
      libs.libsecurity_utilities xpcPrivate
      args.darwin.bootstrap_cmds args.sqlite
    ];
    NIX_CFLAGS_COMPILE = "-Wno-deprecated-declarations";
    customPreBuild = ''
      pushd "$TOP/libsecurityd"
      make -f mig/mig.mk SRCROOT=. BUILT_PRODUCTS_DIR=. PROJECT_DIR=. DERIVED_SRC=lib
      popd

      ln -sv "$TOP/libsecurityd/lib" "$TMPDIR/securityd_client"
      ln -sv "$TOP/libsecurity_cdsa_utilities/lib" "$TMPDIR/security_cdsa_utilities"
      ln -sv "$PWD/lib" "$TMPDIR/Security"
      ln -sv "$TOP/libsecurity_keychain/lib/"*.h "$TMPDIR/Security"
      ln -sv "$TOP/libsecurity_cms/lib/"*.h "$TMPDIR/Security"
      ln -sfv "$TOP/libsecurity_smime/lib/"*.h "$TMPDIR/Security"
      ln -sfv "$TOP/libsecurity_cssm/lib/"*.h "$TMPDIR/Security"

      cat >lib/codesigning_dtrace.h <<EOF
      #define CODESIGN_DYNAMIC_CREATE(x,y)
      #define CODESIGN_EVAL_DYNAMIC_ROOT(x)
      #define CODESIGN_EVAL_DYNAMIC_START_ENABLED() 1
      #define CODESIGN_EVAL_DYNAMIC_START(x,...)
      #define CODESIGN_EVAL_DYNAMIC_END(x)
      #define CODESIGN_EVAL_STATIC_EXECUTABLE_END(x)
      #define CODESIGN_EVAL_STATIC_EXECUTABLE_FAIL(x,y)
      #define CODESIGN_EVAL_STATIC_EXECUTABLE_START(x,...)
      #define CODESIGN_EVAL_STATIC_RESOURCES_START_ENABLED() 1
      #define CODESIGN_EVAL_STATIC_RESOURCES_START(x,...)
      #define CODESIGN_EVAL_STATIC_RESOURCES_END(x)
      #define CODESIGN_EVAL_STATIC_INTREQ_START_ENABLED() 1
      #define CODESIGN_EVAL_STATIC_INTREQ_START(x,...)
      #define CODESIGN_EVAL_STATIC_INTREQ_END(x)
      #define CODESIGN_EVAL_STATIC_START_ENABLED() 1
      #define CODESIGN_EVAL_STATIC_START(x,...)
      #define CODESIGN_EVAL_STATIC_END(x)
      #define SYSPOLICY_ASSESS_API(x,y,z)
      #define SYSPOLICY_ASSESS_LOCAL()
      #define SYSPOLICY_ASSESS_REMOTE()
      EOF

      cat >lib/esp.h <<EOF
      int __esp_enabled(void);
      OSStatus __esp_check_ns(const char*, void*);
      void __esp_notify_ns(const char*, void*);
      EOF

      substituteInPlace lib/SecTask.c \
        --replace CoreFoundation/CFRuntime.h ${srcs.CF}/CFRuntime.h
      substituteInPlace lib/SecTask.c \
        --replace System/sys/codesign.h ${srcs.xnu}/bsd/sys/codesign.h
      substituteInPlace lib/cs.h \
        --replace '<Security/SecBasePriv.h>' "\"$TOP/libsecurity_keychain/lib/SecBasePriv.h\""
      substituteInPlace lib/StaticCode.cpp \
        --replace '<Security/SecPolicyPriv.h>' "\"$TOP/libsecurity_keychain/lib/SecPolicyPriv.h\""
      substituteInPlace lib/SecAssessment.cpp \
        --replace CoreFoundation/CFRuntime.h ${srcs.CF}/CFRuntime.h

      NIX_CFLAGS_COMPILE+=" -isystem $PWD/antlr2 -isystem $PWD/lib"

      sed -i '/kSecCodeSignatureNoHash\t/d' lib/CSCommonPriv.h
      sed -i '/kSecCodeSignatureHashSHA1\t/d' lib/CSCommonPriv.h
      sed -i '/kSecCodeSignatureHashSHA256\t/d' lib/CSCommonPriv.h
    '';
    # nativeBuildInputs = [ libs.libsecurityd ];
  };

  libsecurity_utilities = attrs: attrs // {
    nativeBuildInputs = [ args.sqlite args.libcxxabi ];
    patchPhase = ''
      cat >lib/utilities_dtrace.h <<EOF
      #define SECURITY_DEBUG_DELAY(x)
      #define SECURITY_DEBUG_REFCOUNT_CREATE
      #define SECURITY_DEBUG_REFCOUNT_DOWN
      #define SECURITY_DEBUG_REFCOUNT_UP
      #define SECURITY_DEBUG_LOG_ENABLED() 1
      #define SECURITY_DEBUG_LOG(x,y)
      #define SECURITY_DEBUG_SEC_CREATE_ENABLED() 1
      #define SECURITY_DEBUG_SEC_CREATE(x,y,z)
      #define SECURITY_DEBUG_SEC_DESTROY(x)
      #define SECURITY_EXCEPTION_HANDLED(x)
      #define SECURITY_EXCEPTION_COPY(x,y)
      #define SECURITY_EXCEPTION_THROW_CSSM(x,y)
      #define SECURITY_EXCEPTION_THROW_CF(x)
      #define SECURITY_EXCEPTION_THROW_MACH(x,y)
      #define SECURITY_EXCEPTION_THROW_OSSTATUS(x,y)
      #define SECURITY_EXCEPTION_THROW_OTHER(x,y,z)
      #define SECURITY_EXCEPTION_THROW_PCSC(x,y)
      #define SECURITY_EXCEPTION_THROW_SQLITE(x,y,z)
      #define SECURITY_EXCEPTION_THROW_UNIX(x,y)
      #define SECURITY_MACHSERVER_ALLOC_REGISTER(x,y)
      #define SECURITY_MACHSERVER_ALLOC_RELEASE(x,y)
      #define SECURITY_MACHSERVER_BEGIN(x,y)
      #define SECURITY_MACHSERVER_END()
      #define SECURITY_MACHSERVER_END_THREAD(x)
      #define SECURITY_MACHSERVER_PORT_ADD(x)
      #define SECURITY_MACHSERVER_PORT_REMOVE(x)
      #define SECURITY_MACHSERVER_REAP(x,y)
      #define SECURITY_MACHSERVER_RECEIVE(x)
      #define SECURITY_MACHSERVER_RECEIVE_ENABLED() 1
      #define SECURITY_MACHSERVER_RECEIVE_ERROR(x)
      #define SECURITY_MACHSERVER_SEND_ERROR(x,y)
      #define SECURITY_MACHSERVER_START_THREAD(x)
      #define SECURITY_MACHSERVER_TIMER_END(x)
      #define SECURITY_MACHSERVER_TIMER_START(x,y,z)
      EOF

      substituteInPlace lib/cfclass.h \
        --replace CoreFoundation/CFRuntime.h ${srcs.CF}/CFRuntime.h
      substituteInPlace lib/seccfobject.h \
        --replace CoreFoundation/CFRuntime.h ${srcs.CF}/CFRuntime.h
      substituteInPlace lib/seccfobject.cpp \
        --replace auto_zone.h ${srcs.libauto}/auto_zone.h
      substituteInPlace lib/osxcode.cpp \
        --replace CoreFoundation/CFBundlePriv.h ${srcs.CF}/CFBundlePriv.h
      substituteInPlace lib/cfclass.cpp \
        --replace auto_zone.h ${srcs.libauto}/auto_zone.h
      substituteInPlace lib/hashing.cpp \
        --replace CommonCrypto/CommonDigestSPI.h ${srcs.CommonCrypto}/include/CommonDigestSPI.h
      substituteInPlace lib/hashing.h \
        --replace CommonCrypto/CommonDigestSPI.h ${srcs.CommonCrypto}/include/CommonDigestSPI.h
      substituteInPlace lib/mach++.cpp \
        --replace bootstrap_priv.h ${srcs.launchd}/liblaunch/bootstrap_priv.h
      substituteInPlace lib/powerwatch.h \
        --replace IOKit/pwr_mgt/IOPMLibPrivate.h ${srcs.IOKitUser}/pwr_mgt.subproj/IOPMLibPrivate.h
      substituteInPlace lib/vproc++.cpp \
        --replace vproc_priv.h ${srcs.launchd}/liblaunch/vproc_priv.h
    '';
    frameworks = [ "PCSC" ];
    __impureHostDeps = [
      "${builtins.xcodeSDKRoot}/usr/lib/libauto.tbd"
      "${builtins.xcodeSDKRoot}/usr/lib/libbsm.tbd"
    ];
    NIX_LDFLAGS = ''
      -lauto -lbsm -lc++ -lc++abi -lsqlite3 -lobjc
      -framework CoreFoundation -framework IOKit -framework PCSC -framework Security
    '';
  };

  libsecurityd = attrs: attrs // {
    nativeBuildInputs = [
      libs.libsecurity_cdsa_utilities libs.libsecurity_utilities args.darwin.bootstrap_cmds
    ];
    libname = "libsecurityd_client";
    patchPhase = ''
      ln -sv "$TOP/libsecurity_cdsa_utilities/lib" "$TMPDIR/security_cdsa_utilities"
      ln -sv "$TOP/libsecurity_cdsa_client/lib" "$TMPDIR/security_cdsa_client"
    '';
    customPreBuild = ''
      make -f mig/mig.mk SRCROOT=. BUILT_PRODUCTS_DIR=. PROJECT_DIR=. DERIVED_SRC=lib
    '';
    NIX_LDFLAGS = ''
      -lc++ -lsecurity_utilities -framework CoreFoundation -framework Security
    '';
  };
}
