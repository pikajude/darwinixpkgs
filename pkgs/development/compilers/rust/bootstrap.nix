{ stdenv, fetchurl, makeWrapper, cacert, zlib, jemalloc, openssl }:

let
  inherit (stdenv.lib) optionalString;

  platform =
    if stdenv.system == "i686-linux"
    then "i686-unknown-linux-gnu"
    else if stdenv.system == "x86_64-linux"
    then "x86_64-unknown-linux-gnu"
    else if stdenv.system == "i686-darwin"
    then "i686-apple-darwin"
    else if stdenv.system == "x86_64-darwin"
    then "x86_64-apple-darwin"
    else abort "missing boostrap url for platform ${stdenv.system}";

  # fetch hashes by running `print-hashes.sh 1.9.0`
  bootstrapHash =
    if stdenv.system == "i686-linux"
    then "1hjs3dy2g83kpzbhkq13xs3lnfanlvks1ca72jkjgs7g7pazb8zm"
    else if stdenv.system == "x86_64-linux"
    then "0gyq8wamj964xgx672fa5dn584qr9samijqhqjk8zjwljinvvszl"
    else if stdenv.system == "i686-darwin"
    then "40d4782a58dd5bef22dbbaa7a363f3b42f844628db07205f6435ac934f350061"
    else if stdenv.system == "x86_64-darwin"
    then "0dfcdrjxm87xs3vf6qh82vmmcnbkgnvig0r96npyr1nw71sc9nrc"
    else throw "missing boostrap hash for platform ${stdenv.system}";

  needsPatchelf = stdenv.isLinux;

  src = fetchurl {
     url = "https://static.rust-lang.org/dist/rust-${version}-${platform}.tar.gz";
     sha256 = bootstrapHash;
  };

  version = "1.11.0";
in

rec {
  rustc = stdenv.mkDerivation rec {
    name = "rustc-bootstrap-${version}";

    inherit version;
    inherit src;

    buildInputs = [ makeWrapper ];
    phases = ["unpackPhase" "installPhase"];

    installPhase = ''
      ./install.sh --prefix=$out \
        --components=rustc,rust-std-${platform},rust-docs

      ${optionalString needsPatchelf ''
        patchelf \
          --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
          "$out/bin/rustc"
      ''}

      # Do NOT, I repeat, DO NOT use `wrapProgram` on $out/bin/rustc
      # (or similar) here. It causes strange effects where rustc loads
      # the wrong libraries in a bootstrap-build causing failures that
      # are very hard to track dow. For details, see
      # https://github.com/rust-lang/rust/issues/34722#issuecomment-232164943
    '';
  };

  cargo = stdenv.mkDerivation rec {
    name = "cargo-bootstrap-${version}";

    inherit version;
    inherit src;

    buildInputs = [ makeWrapper zlib rustc ];
    phases = ["unpackPhase" "installPhase"];

    __propagatedImpureHostDeps = [
      "/usr/lib/libssl.dylib"
      "/usr/lib/libcurl.dylib"
    ];

    installPhase = ''
      ./install.sh --prefix=$out \
        --components=cargo

      ${optionalString needsPatchelf ''
        patchelf \
          --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
          "$out/bin/cargo"
      ''}

      wrapProgram "$out/bin/cargo" \
        --suffix PATH : "${rustc}/bin"
    '';
  };
}
