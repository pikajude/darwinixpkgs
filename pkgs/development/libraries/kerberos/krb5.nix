{ stdenv, fetchurl, pkgconfig, perl, yacc
, openssl, openldap, libedit, bootstrap_cmds

# Extra Arguments
, type ? ""
}:

let
  libOnly = type == "lib";
in
with stdenv.lib;
stdenv.mkDerivation rec {
  name = "${type}krb5-${version}";
  majorVersion = "1.15";
  version = "${majorVersion}";

  src = fetchurl {
    url = "${meta.homepage}dist/krb5/${majorVersion}/krb5-${version}.tar.gz";
    sha256 = "0z0jxm6ppbxi9anv2h12nrb5lpwl95f96kw6dx7sn268fhkpad7x";
  };

  configureFlags = optional stdenv.isFreeBSD ''WARN_CFLAGS=""'';

  nativeBuildInputs = [ pkgconfig perl yacc ];
  buildInputs = [ openssl ]
    ++ optionals (!libOnly) [ openldap libedit ]
    ++ optional stdenv.isDarwin bootstrap_cmds;

  preConfigure = "cd ./src";

  buildPhase = optionalString libOnly ''
    (cd util; make -j $NIX_BUILD_CORES)
    (cd include; make -j $NIX_BUILD_CORES)
    (cd lib; make -j $NIX_BUILD_CORES)
    (cd build-tools; make -j $NIX_BUILD_CORES)
  '';

  installPhase = optionalString libOnly ''
    mkdir -p $out/{bin,include/{gssapi,gssrpc,kadm5,krb5},lib/pkgconfig,sbin,share/{et,man/man1}}
    (cd util; make -j $NIX_BUILD_CORES install)
    (cd include; make -j $NIX_BUILD_CORES install)
    (cd lib; make -j $NIX_BUILD_CORES install)
    (cd build-tools; make -j $NIX_BUILD_CORES install)
    rm -rf $out/{sbin,share}
    find $out/bin -type f | grep -v 'krb5-config' | xargs rm
  '';

  enableParallelBuilding = true;

  meta = {
    description = "MIT Kerberos 5";
    homepage = http://web.mit.edu/kerberos/;
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ wkennington ];
  };

  passthru.implementation = "krb5";
}
