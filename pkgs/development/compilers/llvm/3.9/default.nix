{ newScope, stdenv, isl, fetchurl, overrideCC, wrapCC, cctools, ccWrapperFun }:
let
  callPackage = newScope (self // { inherit stdenv isl version fetch; });

  version = "3.9.0";

  fetch = fetch_v version;
  fetch_v = ver: name: sha256: fetchurl {
    url = "http://llvm.org/releases/${version}/${name}-${ver}.src.tar.xz";
    inherit sha256;
  };

  compiler-rt_src = fetch "compiler-rt" "00ljgkjcds0z2z96zv02x39wryj902q29i895xixg60hd0909qra";
  clang-tools-extra_src = fetch "clang-tools-extra" "052zg0h5vbmxnh2ikc743rw3649f112dfyn8hg39x6cfxi3fqyjv";

  self = {
    llvm = callPackage ./llvm.nix {
      inherit compiler-rt_src stdenv cctools;
    };

    clang-unwrapped = callPackage ./clang {
      inherit clang-tools-extra_src stdenv;
    };

    clang = wrapCC self.clang-unwrapped;

    libcxxClang = ccWrapperFun {
      cc = self.clang-unwrapped;
      isClang = true;
      inherit (self) stdenv;
      /* FIXME is this right? */
      inherit (stdenv.cc) libc nativeTools nativeLibc;
      extraPackages = [ self.libcxx self.libcxxabi ];
    };

    stdenv = overrideCC stdenv self.clang;

    libcxxStdenv = overrideCC stdenv self.libcxxClang;

    lldb = callPackage ./lldb.nix {};

    libcxx = callPackage ./libc++ {};

    libcxxabi = callPackage ./libc++abi.nix {};
  };
in self
