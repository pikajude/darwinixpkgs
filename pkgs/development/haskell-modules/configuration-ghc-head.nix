{ pkgs }:

with import ./lib.nix { inherit pkgs; };

self: super: {

  # Use the latest LLVM.
  inherit (pkgs) llvmPackages;

  # Disable GHC 7.11.x core libraries.
  array = null;
  base = null;
  binary = null;
  bin-package-db = null;
  bytestring = null;
  Cabal = null;
  containers = null;
  deepseq = null;
  directory = null;
  filepath = null;
  ghc-boot = null;
  ghc-boot-th = null;
  ghc-prim = null;
  ghci = null;
  haskeline = null;
  hoopl = null;
  hpc = null;
  integer-gmp = null;
  pretty = null;
  process = null;
  rts = null;
  template-haskell = null;
  terminfo = null;
  time = null;
  transformers = null;
  unix = null;
  xhtml = null;

  cabal-install = overrideCabal (super.cabal-install.overrideScope (_: _: { Cabal = null; })) (drv: {
    version = "1.25.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "haskell";
      repo = "cabal";
      rev = "4efe8c22cc0e12b41adac47870115a4619a1c763";
      sha256 = "1fad2759cxj2cmxga8vrgsrbbwmvxva7gxdfvz4glfrmfb02w66l";
    };
    postUnpack = "sourceRoot+=/cabal-install";
    editedCabalFile = null;
  });

  # jailbreak-cabal can use the native Cabal library.
  jailbreak-cabal = super.jailbreak-cabal.override { Cabal = null; };

  # haddock: No input file(s).
  nats = dontHaddock super.nats;
  bytestring-builder = dontHaddock super.bytestring-builder;

  # We have time 1.5
  aeson = disableCabalFlag super.aeson "old-locale";

  # Show works differently for record syntax now, breaking haskell-src-exts' parser tests
  # https://github.com/haskell-suite/haskell-src-exts/issues/224
  haskell-src-exts = dontCheck super.haskell-src-exts;

  # Setup: At least the following dependencies are missing: base <4.8
  hspec-expectations = overrideCabal super.hspec-expectations (drv: {
    postPatch = "sed -i -e 's|base < 4.8|base|' hspec-expectations.cabal";
  });
  utf8-string = overrideCabal super.utf8-string (drv: {
    postPatch = "sed -i -e 's|base >= 3 && < 4.8|base|' utf8-string.cabal";
  });

  # bos/attoparsec#92
  attoparsec = dontCheck super.attoparsec;

  # test suite hangs silently for at least 10 minutes
  split = dontCheck super.split;

  # Test suite fails with some (seemingly harmless) error.
  # https://code.google.com/p/scrapyourboilerplate/issues/detail?id=24
  syb = dontCheck super.syb;

  # Test suite has stricter version bounds
  retry = dontCheck super.retry;

  # Test suite fails with time >= 1.5
  http-date = dontCheck super.http-date;

  # Version 1.19.5 fails its test suite.
  happy = dontCheck super.happy;

  # Workaround for a workaround, see comment for "ghcjs" flag.
  jsaddle = let jsaddle' = disableCabalFlag super.jsaddle "ghcjs";
            in addBuildDepends jsaddle' [ self.glib self.gtk3 self.webkitgtk3
                                          self.webkitgtk3-javascriptcore ];

  # The compat library is empty in the presence of mtl 2.2.x.
  mtl-compat = dontHaddock super.mtl-compat;

  # Won't work with LLVM 3.5.
  llvm-general = markBrokenVersion "3.4.5.3" super.llvm-general;

  extra = overrideCabal super.extra (drv: {
    postPatch = ''
      sed -i -e '20,21d;29,30d' src/Data/Either/Extra.hs
    '';
    doCheck = false;
  });

  cryptohash-sha256 = dontCheck super.cryptohash-sha256;

  haddock-api = null;

  hackage-security = dontCheck (appendPatch super.hackage-security (builtins.toFile "unreachable.patch" ''
      diff --git a/hackage-security/src/Hackage/Security/Client/Repository/Remote.hs b/hackage-security/src/Hackage/Security/Client/Repository/Remote.hs
    index 558c982..25bbfc1 100644
    --- a/src/Hackage/Security/Client/Repository/Remote.hs
    +++ b/src/Hackage/Security/Client/Repository/Remote.hs
    @@ -445,6 +445,12 @@ getFile cfg@RemoteConfig{..} attemptNr remoteFile method =
                                     (mustCache remoteFile)
             return (Some format, remoteTemp)

    +    httpGetRange :: forall a. Throws SomeRemoteError
    +                 => [HttpRequestHeader]
    +                 -> URI
    +                 -> (Int, Int)
    +                 -> (HttpStatus -> [HttpResponseHeader] -> BodyReader -> IO a)
    +                 -> IO a
         HttpLib{..} = cfgHttpLib
  ''));

  # A bunch of jailbreaks due to 'base' bump
  old-locale = doJailbreak super.old-locale;
  primitive = doJailbreak super.primitive;
  test-framework = doJailbreak super.test-framework;
  atomic-primops = doJailbreak (appendPatch super.atomic-primops ./patches/atomic-primops-Cabal-1.25.patch);
  hashable = doJailbreak super.hashable;
  stm = doJailbreak super.stm;
}
