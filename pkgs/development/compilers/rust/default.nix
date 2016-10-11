{ stdenv, callPackage, recurseIntoAttrs, makeRustPlatform,
  targets ? [], targetToolchains ? [], targetPatches ? [] }:

let
  rustPlatform = recurseIntoAttrs (makeRustPlatform (callPackage ./bootstrap.nix {}));
in

rec {
  rustc = callPackage ./rustc.nix {
    shortVersion = "1.12.0";
    isRelease = true;
    forceBundledLLVM = false;
    configureFlags = [ "--release-channel=stable" ];
    srcRev = "8e1f792ccf600ab523b3d52515ffb7ae86d156a7";
    srcSha = "1zkv7hyjvcj7kvbngf309skgllk6rd7727a6hkvhd3hg8jlz0d00";

    patches = [
      ./patches/disable-lockfile-check.patch
    ] ++ stdenv.lib.optional stdenv.needsPax ./patches/grsec.patch;

    inherit targets;
    inherit targetPatches;
    inherit targetToolchains;
    inherit rustPlatform;
  };

  cargo = callPackage ./cargo.nix rec {
    version = "0.12.0";
    srcRev = "6b98d1f8abf5b33c1ca2771d3f5f3bafc3407b93";
    srcSha = "0pq6l3yzmh2il6320f6501hvp9iikdxzl34i5b52v93ncpim36bk";
    depsSha256 = "1jrwzm9fd15kf2d5zb17q901hx32h711ivcwdpxpmzwq08sjlcvl";

    inherit rustc; # the rustc that will be wrapped by cargo
    inherit rustPlatform; # used to build cargo
  };
}
