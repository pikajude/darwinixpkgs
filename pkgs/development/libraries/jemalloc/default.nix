{ stdenv, fetchurl, fetchpatch }:

stdenv.mkDerivation rec {
  name = "jemalloc-${version}";
  version = "4.3.1";

  src = fetchurl {
    url = "https://github.com/jemalloc/jemalloc/releases/download/${version}/${name}.tar.bz2";
    sha256 = "12r71i8nm3vwz21fc16rwbb0pwcg5s05n1qg3rwl2s85v0x1ifzp";
  };

  # By default, jemalloc puts a je_ prefix onto all its symbols on OSX, which
  # then stops downstream builds (mariadb in particular) from detecting it. This
  # option should remove the prefix and give us a working jemalloc.
  configureFlags = stdenv.lib.optional stdenv.isDarwin "--with-jemalloc-prefix=";

  patches = stdenv.lib.optional stdenv.isDarwin (fetchpatch {
    url = "https://patch-diff.githubusercontent.com/raw/jemalloc/jemalloc/pull/427.patch";
    sha256 = "0b3gzv4yz5s016gwqrvhpr5xw31zanja6y83qm6v91qjz6w196as";
  });

  meta = with stdenv.lib; {
    homepage = http://jemalloc.net;
    description = "General purpose malloc(3) implementation";
    longDescription = ''
      malloc(3)-compatible memory allocator that emphasizes fragmentation
      avoidance and scalable concurrency support.
    '';
    license = licenses.bsd2;
    platforms = platforms.all;
    maintainers = with maintainers; [ wkennington ];
  };
}
