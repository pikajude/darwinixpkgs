{ stdenv, fetchzip, runCommand, rsync }:

stdenv.lib.genAttrs ["10_9" "10_10"] (_version:
let version = stdenv.lib.replaceChars ["_"] ["."] _version; in

runCommand "OSX-Private-Headers-${version}" {
  src = fetchzip {
    url = "https://github.com/samdmarshall/OSXPrivateSDK/tarball/f4d52b60e86b496abfaffa119a7d299562d99783";
    name = "OSXPrivateSDK.tar.gz";
    sha256 = "0bv0884yxpvk2ishxj8gdy1w6wb0gwfq55q5qjp0s8z0z7f63zqh";
  };
  inherit rsync;
} ''
  mkdir -p $out/include
  cd $src/PrivateSDK${version}.sparse.sdk

  cp -RL --no-preserve=all System/Library $out
  cp -RL --no-preserve=all usr/local/include/* $out/include
  cp -RL --no-preserve=all usr/include/* $out/include 2>/dev/null || true # duplicate headers

  cd $out/Library
  find . -name PrivateHeaders -type d -print0 |
    while IFS= read -r -d ''$'\0' line; do
      pushd "$(dirname "$line")" >/dev/null
      echo "syncing $PWD/PrivateHeaders with $PWD/Headers"
      $rsync/bin/rsync -ah --ignore-existing ./PrivateHeaders/ ./Headers/
      rm -rf PrivateHeaders
      popd >/dev/null
    done

  mkdir -p $out/nix-support
  substituteAll ${./setup-hook.sh} $out/nix-support/setup-hook
''
)
