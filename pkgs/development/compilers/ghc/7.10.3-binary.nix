{stdenv, fetchurl, perl, ncurses, gmp, libiconv, makeWrapper}:

stdenv.mkDerivation rec {
  version = "7.10.3";

  name = "ghc-${version}-binary";

  src =
    if stdenv.system == "x86_64-darwin" then
      fetchurl {
        url = "http://haskell.org/ghc/dist/${version}/ghc-${version}-x86_64-apple-darwin.tar.bz2";
        sha256 = "0ykm1g7wmwlj7svr5rqly2qrcg9f43gll1mjgmgi0643gqv3x2c0";
      }
    else throw "cannot bootstrap GHC on this platform";

  buildInputs = [perl];

  postUnpack =
    # Strip is harmful, see also below. It's important that this happens
    # first. The GHC Cabal build system makes use of strip by default and
    # has hardcoded paths to /usr/bin/strip in many places. We replace
    # those below, making them point to our dummy script.
     ''
      mkdir "$TMP/bin"
      for i in strip; do
        echo '#! ${stdenv.shell}' > "$TMP/bin/$i"
        chmod +x "$TMP/bin/$i"
      done
      PATH="$TMP/bin:$PATH"
     '' +
    # We have to patch the GMP paths for the integer-gmp package.
     ''
      find . -name integer-gmp.buildinfo \
          -exec sed -i "s@extra-lib-dirs: @extra-lib-dirs: ${gmp.out}/lib@" {} \;
     '' + stdenv.lib.optionalString stdenv.isDarwin ''
      find . -name base.buildinfo \
          -exec sed -i "s@extra-lib-dirs: @extra-lib-dirs: ${libiconv}/lib@" {} \;
     '' +
    # On Linux, use patchelf to modify the executables so that they can
    # find editline/gmp.
    stdenv.lib.optionalString stdenv.isLinux ''
      patchShebangs .

      mkdir -p "$out/lib"
      ln -sv "${ncurses.out}/lib/libncurses.so" "$out/lib/libncurses${stdenv.lib.optionalString stdenv.is64bit "w"}.so.5"
      find . -type f -perm -0100 \
          -exec patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
          --set-rpath "$out/lib:${gmp.out}/lib" {} \;
      sed -i "s|/usr/bin/perl|perl\x00        |" ghc-${version}/ghc/stage2/build/tmp/ghc-stage2
      sed -i "s|/usr/bin/gcc|gcc\x00        |" ghc-${version}/ghc/stage2/build/tmp/ghc-stage2
      for prog in ld ar gcc strip ranlib; do
        find . -name "setup-config" -exec sed -i "s@/usr/bin/$prog@$(type -p $prog)@g" {} \;
      done
     '' + stdenv.lib.optionalString stdenv.isDarwin ''
     '';
/*
       # not enough room in the object files for the full path to libiconv :(
       fix () {
         install_name_tool -change /usr/lib/libiconv.2.dylib @executable_path/libiconv.dylib $1
       }

       ln -s ${libiconv}/lib/libiconv.dylib ghc-${version}/utils/ghc-pwd/dist-install/build/tmp
       ln -s ${libiconv}/lib/libiconv.dylib ghc-${version}/utils/hpc/dist-install/build/tmp
       ln -s ${libiconv}/lib/libiconv.dylib ghc-${version}/ghc/stage2/build/tmp

       for file in ghc-cabal ghc-pwd ghc-stage2 ghc-pkg haddock hsc2hs hpc; do
         fix $(find . -type f -name $file)
       done

       for file in $(find . -name setup-config); do
         substituteInPlace $file --replace /usr/bin/ranlib "$(type -P ranlib)"
       done
     '';
     */

  configurePhase = ''
    ./configure --prefix=$out \
      --with-gmp-libraries=${gmp.out or gmp}/lib --with-gmp-includes=${gmp.dev or gmp}/include \
      ${stdenv.lib.optionalString stdenv.isDarwin "--with-gcc=${./gcc-clang-wrapper.sh}"}
  '';

  # Stripping combined with patchelf breaks the executables (they die
  # with a segfault or the kernel even refuses the execve). (NIXPKGS-85)
  dontStrip = true;

  # No building is necessary, but calling make without flags ironically
  # calls install-strip ...
  dontBuild = true;

  NIX_LDFLAGS = "-no_dtrace_dof";

  postInstall = ''
    # Sanity check, can ghc create executables?
    cd $TMP
    mkdir test-ghc; cd test-ghc
    cat > main.hs << EOF
      {-# LANGUAGE TemplateHaskell #-}
      module Main where
      main = putStrLn \$([|"yes"|])
    EOF
    $out/bin/ghc --make main.hs || exit 1
    echo compilation ok
    [ $(./main) == "yes" ]
  '';

  meta.license = stdenv.lib.licenses.bsd3;
  meta.platforms = ["x86_64-linux" "i686-linux" "x86_64-darwin"];
}
