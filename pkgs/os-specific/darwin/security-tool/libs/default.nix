{ stdenv, src, callPackage, fetchzip, sqlite, runCommand, darwin, antlr }:

let
  xpcPrivate = runCommand "xpc-private" {} ''
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

in stdenv.mkDerivation ({
  name = "security-tool-libs";
  inherit src;
  builder = ./builder.sh;
  maker = ./Makefile;

  buildInputs = [ antlr darwin.bootstrap_cmds sqlite xpcPrivate ];

  __impureHostDeps = [
    "${builtins.xcodeSDKRoot}/usr/lib/libauto.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libbsm.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libxar.tbd"
    "${builtins.xcodeSDKRoot}/usr/lib/libOpenScriptingUtil.tbd"
  ];

  NIX_CFLAGS_COMPILE = "-Wno-deprecated-declarations";

  LIBS = [
    "authd"
    "security_utilities" "securityd" "security_codesigning"
    "security_cdsa_utilities" "security_authorization"
  ];

  frameworks = [ "PCSC" "System" ];
} // stdenv.lib.mapAttrs' (name: value:
  stdenv.lib.nameValuePair ("srcs_${name}") value
) (import ./srcs.nix { inherit fetchzip; }))

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
