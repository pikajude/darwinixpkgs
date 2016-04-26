{ stdenv, src, callPackage, fetchzip, sqlite, runCommand, darwin, antlr, openssl }:

let
  xpcPrivate = runCommand "xpc-private" {} ''
    mkdir -p $out/include/xpc $out/include/CoreFoundation
    cat >$out/include/xpc/private.h <<EOF
    #include <xpc/xpc.h>
    extern void xpc_connection_set_target_uid(xpc_connection_t, uid_t);
    extern void xpc_connection_set_instance(xpc_connection_t, uuid_t);
    extern void xpc_dictionary_set_mach_send(xpc_object_t, const char*, mach_port_t);
    extern int _xpc_runtime_is_app_sandboxed();
    EOF
    cat >$out/include/CoreFoundation/CFXPCBridge.h <<EOF
    extern CFTypeRef _CFXPCCreateCFObjectFromXPCObject(xpc_object_t);
    extern xpc_object_t _CFXPCCreateXPCObjectFromCFObject(CFTypeRef);
    EOF
    cat >$out/include/sandbox_private.h <<EOF
    #ifndef _SANDBOX_PRIVATE_H_
    #define _SANDBOX_PRIVATE_H_

    #include <sandbox.h>

    __BEGIN_DECLS

    #define SANDBOX_NAMED_BUILTIN	0x0002
    #define SANDBOX_NAMED_EXTERNAL	0x0003
    #define SANDBOX_NAMED_MASK	0x000f

    int sandbox_init_with_parameters(const char *profile, uint64_t flags, const char *const parameters[], char **errorbuf);

    int sandbox_init_with_extensions(const char *profile, uint64_t flags, const char *const extensions[], char **errorbuf);

    enum sandbox_filter_type {
    	SANDBOX_FILTER_NONE,
    	SANDBOX_FILTER_PATH,
    	SANDBOX_FILTER_GLOBAL_NAME,
    	SANDBOX_FILTER_LOCAL_NAME,
    	SANDBOX_FILTER_APPLEEVENT_DESTINATION,
    	SANDBOX_FILTER_RIGHT_NAME,
    };

    extern const enum sandbox_filter_type SANDBOX_CHECK_NO_REPORT __attribute__((weak_import));

    enum sandbox_extension_flags {
    	FS_EXT_DEFAULTS =              0,
    	FS_EXT_FOR_PATH =       (1 << 0),
    	FS_EXT_FOR_FILE =       (1 << 1),
    	FS_EXT_READ =           (1 << 2),
    	FS_EXT_WRITE =          (1 << 3),
    	FS_EXT_PREFER_FILEID =  (1 << 4),
    };

    int sandbox_check(pid_t pid, const char *operation, enum sandbox_filter_type type, ...);

    int sandbox_note(const char *note);

    int sandbox_suspend(pid_t pid);
    int sandbox_unsuspend(void);

    int sandbox_issue_extension(const char *path, char **ext_token);
    int sandbox_issue_fs_extension(const char *path, uint64_t flags, char **ext_token);
    int sandbox_issue_fs_rw_extension(const char *path, char **ext_token);
    int sandbox_issue_mach_extension(const char *name, char **ext_token);

    int sandbox_consume_extension(const char *path, const char *ext_token);
    int sandbox_consume_fs_extension(const char *ext_token, char **path);
    int sandbox_consume_mach_extension(const char *ext_token, char **name);

    int sandbox_release_fs_extension(const char *ext_token);

    int sandbox_container_path_for_pid(pid_t pid, char *buffer, size_t bufsize);

    int sandbox_wakeup_daemon(char **errorbuf);

    const char *_amkrtemp(const char *);

    __END_DECLS

    #endif /* _SANDBOX_H_ */
    EOF
  '';

  deps = [ "CF" "CommonCrypto" "IOKitUser" "Libinfo" "launchd" "libauto" "securityd"
  "libsecurity_agent" "security_dotmac_tp" "xnu" ];

  srcs = import ./srcs.nix { inherit fetchzip; };
  srcs_filter = stdenv.lib.filterAttrs (x: y: builtins.elem x deps) srcs;
  srcs_map = stdenv.lib.mapAttrs' (n: v: stdenv.lib.nameValuePair ("srcs_${n}") v) srcs_filter;

in stdenv.mkDerivation ({
  name = "security-tool-libs";
  inherit src;
  builder = "${./scripts}/builder.sh";
  maker = ./Makefile;

  inherit sqlite;

  buildInputs = [ antlr darwin.bootstrap_cmds sqlite xpcPrivate openssl ];

  __impureHostDeps = [
    "${builtins.xcodeSDKRoot}/usr/lib/libauto.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libbsm.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libxar.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libOpenScriptingUtil.tbd"
  ];

  NIX_CFLAGS_COMPILE = [
    "-Wno-deprecated-declarations"
  ];

  LIBS = [
    "authd" "security_utilities" "securityd" "security_codesigning"
    "security_smime" "security_cdsa_utils" "security_cdsa_utilities" "security_authorization"
    "security_asn1" "security_cdsa_client"
  ];

  frameworks = [ "PCSC" "System" ];

  dontStrip = true;
} // srcs_map)

/*
let
  mkDerivation = name:
    let attrs = {
          inherit name src preBuild buildPhase installPhase postUnpack;
          libname = name;
          sourceRoot = "Security-55471.14/${name}";
        };
        newAttrs = (overrides."${name}" or (x: x)) attrs;
        stdenv = newAttrs.stdenv or args.stdenv;
    in stdenv.mkDerivation (removeAttrs newAttrs [ "stdenv" ]);

  overrides = import ./overrides.nix { inherit args libs; };

  postUnpack = ''
    BARENAME="''${libname#lib}"
    TOP="$(echo $PWD/Security-*)"
  '';

  preBuild = ''
    runHook customPreBuild

    ln -sv "$PWD/lib" "$TMPDIR/$BARENAME"
    NIX_CFLAGS_COMPILE+=" -isystem $TMPDIR"
  '';

  buildPhase = ''
    runHook preBuild

    pushd lib

    for file in *.c; do
      echo "compiling $file"
      cc -c "$file" -o "$(basename "$file" .c).o"
    done

    for file in *.cpp; do
      echo "compiling $file"
      c++ -c "$file" -o "$(basename "$file" .cpp).o"
    done

    popd

    ld -macosx_version_min 10.7 -arch x86_64 -dylib \
      -install_name "$out/lib/lib$BARENAME.dylib" \
      -lSystem -o lib$BARENAME.dylib lib/*.o

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/lib"
    install -m 0644 lib$BARENAME.dylib "$out/lib"

    mkdir -p "$out/include/$BARENAME"
    install -m 0644 lib/*.h "$out/include/$BARENAME"

    runHook postInstall
  '';

  libs = stdenv.lib.genAttrs [
    "authd"
    "libsecurity_authorization"
    "libsecurity_cdsa_client"
    "libsecurity_cdsa_utilities"
    "libsecurity_codesigning"
    "libsecurity_utilities"
    "libsecurityd"
  ] mkDerivation;

in libs
*/
