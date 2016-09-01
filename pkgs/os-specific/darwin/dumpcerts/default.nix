{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  name = "dumpcerts-${version}";
  version = "0.1";

  src = fetchgit {
    url = "https://github.com/pikajude/dumpcerts";
    rev = "95bbfd1597d527ff1cd97e6fc55f2df0d70bd017";
    sha256 = "0cv26xj64cszy920snikzs1cbclpvah6a1fd6yisj9865nizxyx3";
  };

  frameworks = [ "Foundation" ];

  installPhase = ''
    install -D dump-certs $out/bin/dump-certs
  '';
}
