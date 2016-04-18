{ fetchzip }:

{
  "AppleFileSystemDriver" = fetchzip {
    url = "http://opensource.apple.com/tarballs/AppleFileSystemDriver/AppleFileSystemDriver-17.tar.gz";
    sha256 = "0h186423v8b0yiqx2qmbckaiznilxxi0swqzw2g163z6f321msxm";
  };
  "AppleRAID" = fetchzip {
    url = "http://opensource.apple.com/tarballs/AppleRAID/AppleRAID-4.0.6.tar.gz";
    sha256 = "1rzs8v24qspjvyi3y2qfvxrx09iiyhvnjncbmrn6q1d0aih11bj3";
  };
  "AppleUSBCDCDriver" = fetchzip {
    url = "http://opensource.apple.com/tarballs/AppleUSBCDCDriver/AppleUSBCDCDriver-4201.2.5.tar.gz";
    sha256 = "1jk156ay1dgjp3jxik4x2ic0xvkcsicajvdzg6z1gda3ys5c6rzf";
  };
  "AppleUSBIrDA" = fetchzip {
    url = "http://opensource.apple.com/tarballs/AppleUSBIrDA/AppleUSBIrDA-145.2.4.tar.gz";
    sha256 = "11h4zkch3k0fp7qjayk5ymbb9gpmsm8gdrsdbynjzjd92ni4q4kq";
  };
  "AvailabilityVersions" = fetchzip {
    url = "http://opensource.apple.com/tarballs/AvailabilityVersions/AvailabilityVersions-6.tar.gz";
    sha256 = "0ss49iqlhvz9sj4qbhnv5n03h92dw6i5rz01s1vzc3ivg0hb6hs4";
  };
  "BerkeleyDB" = fetchzip {
    url = "http://opensource.apple.com/tarballs/BerkeleyDB/BerkeleyDB-21.tar.gz";
    sha256 = "0jx42rzkqscazkvqvkp3nsfadrrhzkk47i981avf078baq3ilxyn";
  };
  "BootCache" = fetchzip {
    url = "http://opensource.apple.com/tarballs/BootCache/BootCache-106.tar.gz";
    sha256 = "17jaw26vwj6pasqrp894cfbzxnn1n47vyncj4f4qfrdk18xjnkhj";
  };
  "CF" = fetchzip {
    url = "http://opensource.apple.com/tarballs/CF/CF-855.14.tar.gz";
    sha256 = "1skpnhk82lxsm3acira2mmvw38hl82frfc2201iy4bxvzff8bg1p";
  };
  "CPAN" = fetchzip {
    url = "http://opensource.apple.com/tarballs/CPAN/CPAN-52.tar.gz";
    sha256 = "11j8x8a5jyj91cwk8mpmzq9qk4x36a4x53hzj499wkkqrcvjwjzy";
  };
  "CPANInternal" = fetchzip {
    url = "http://opensource.apple.com/tarballs/CPANInternal/CPANInternal-140.tar.gz";
    sha256 = "003wlpdlkxlqjskxq4nj5g0cgilhlibn4rii8c1iymsrsqd1b5kj";
  };
  "Chess" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Chess/Chess-310.5.tar.gz";
    sha256 = "08j7n84pdmiqv8xbvms1g0l4d5vg57k7c699a1ymcl5hqmyqic6h";
  };
  "CommonCrypto" = fetchzip {
    url = "http://opensource.apple.com/tarballs/CommonCrypto/CommonCrypto-60049.tar.gz";
    sha256 = "0kq44bdzxy6al7667r0qn7aa8wmkmg60xpd8wx41s2n9ahw0a2dy";
  };
  "CrackLib" = fetchzip {
    url = "http://opensource.apple.com/tarballs/CrackLib/CrackLib-37765.tar.gz";
    sha256 = "0wz37ygj9i4vf8vdbkixrwkrvm18chfp9x853lyrrcgs6b883xbw";
  };
  "Csu" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Csu/Csu-79.tar.gz";
    sha256 = "13yknzr741x9dzab700bglqprvd3gdq4xhbi5n61x4nvb2l0zp30";
  };
  "DiskArbitration" = fetchzip {
    url = "http://opensource.apple.com/tarballs/DiskArbitration/DiskArbitration-266.tar.gz";
    sha256 = "1156x45m5011gq2nr09pl41vq9mvpm253f3x2dy6cx5yj5ih3m51";
  };
  "Heimdal" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Heimdal/Heimdal-323.15.tar.gz";
    sha256 = "1bl7sr2ncg7078fmpnq7fzzf7an98s6vfiia5dlzi16n23pgk7v7";
  };
  "ICU" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ICU/ICU-511.31.tar.gz";
    sha256 = "0yjz21p21274jp5na5rqyy31hg0yv5nmxb5qlid64z4gzjcxvgww";
  };
  "IOATAFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOATAFamily/IOATAFamily-252.0.3.tar.gz";
    sha256 = "1jxy2id7c9vdcsp1l68hynz715f55acp476nz37xambwl979ni3b";
  };
  "IOATAPIProtocolTransport" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOATAPIProtocolTransport/IOATAPIProtocolTransport-350.0.3.tar.gz";
    sha256 = "15gzn0dn0pnq5kzw8ar0fj8h5bkjkfdnwdjrgk5h3qzhbw975cfy";
  };
  "IOAudioFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOAudioFamily/IOAudioFamily-195.4.2.tar.gz";
    sha256 = "1makjgw621y75i44zv79bkn1kl2h35i4a7ddxg67s1dpy5vxx7aj";
  };
  "IOBDStorageFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOBDStorageFamily/IOBDStorageFamily-14.tar.gz";
    sha256 = "0g1qn6lq1302b9jkan7bibn1zb8y2kk42jk30gal2dj99n98xkyf";
  };
  "IOCDStorageFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOCDStorageFamily/IOCDStorageFamily-51.tar.gz";
    sha256 = "1hzjydwchhcpz1l4ajc1g9mrznjx9nz3y2m3r0394c2xaifykhgn";
  };
  "IODVDStorageFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IODVDStorageFamily/IODVDStorageFamily-35.tar.gz";
    sha256 = "02jacmvpsl79axvdgyw66b9w047mpi0d3jqkzg90mv3a5h21r21k";
  };
  "IOFWDVComponents" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFWDVComponents/IOFWDVComponents-207.4.1.tar.gz";
    sha256 = "06j6xw1ch0sm4x0fgvzbmfyccsnavssy3dgjhdzprdhfa57h33d8";
  };
  "IOFireWireAVC" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFireWireAVC/IOFireWireAVC-422.4.0.tar.gz";
    sha256 = "0wvmn9g4bf9jbdbl5m378qhiag8xj5m9bsdnrdqpxdkksn07z82c";
  };
  "IOFireWireFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFireWireFamily/IOFireWireFamily-455.4.0.tar.gz";
    sha256 = "0lh7w2pjzz2g80lg0kn5qv434fdxm2sy1kn0nkzczifjd57kq9gi";
  };
  "IOFireWireIP" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFireWireIP/IOFireWireIP-226.4.tar.gz";
    sha256 = "0w2f4m4bv6cjp289d3ll8szby44szbp2f3fphly7l19rrs6qvb45";
  };
  "IOFireWireSBP2" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFireWireSBP2/IOFireWireSBP2-426.4.1.tar.gz";
    sha256 = "15y9ylbks2y8svbxni3kb143b5lhkhxsbgy6xxbdh113i718vyan";
  };
  "IOFireWireSerialBusProtocolTransport" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOFireWireSerialBusProtocolTransport/IOFireWireSerialBusProtocolTransport-251.0.1.tar.gz";
    sha256 = "11j9kl0qlr1zsbprwk4qj6jmwr6fjw44dmlg6ivb456mvg5csqy9";
  };
  "IOGraphics" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOGraphics/IOGraphics-471.1.tar.gz";
    sha256 = "06g3ipp3ksvhy2d6l24vj114fdx0jpb4z67yx1p3la6rwh9fnvw3";
  };
  "IOHIDFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOHIDFamily/IOHIDFamily-503.90.3.tar.gz";
    sha256 = "1c0275jzm5aci8jxjqzc0yjw7bjkxdk8wc0drhpz21ay9mhaywag";
  };
  "IOKitTools" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOKitTools/IOKitTools-89.1.1.tar.gz";
    sha256 = "1ksljdg6lh2l1kww6km4z2415h18phyf98wbha1cw7jg8n86sa85";
  };
  "IOKitUser" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOKitUser/IOKitUser-907.90.2.tar.gz";
    sha256 = "1h8m88wzq7c4830830aajkg6szcbd4mnp8xykb1xis3lnqv5ixd0";
  };
  "IONetworkingFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IONetworkingFamily/IONetworkingFamily-100.tar.gz";
    sha256 = "0kafrjk32szgsyg011lm2dsbw25ndw4kl0q1qv8ik9zcdk4bgq6q";
  };
  "IOPCIFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOPCIFamily/IOPCIFamily-224.tar.gz";
    sha256 = "088wvn8vl5whbjan5lvcf9inxz3kl5l6fhsf6jxcns8y1krfr0nn";
  };
  "IOSCSIParallelFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOSCSIParallelFamily/IOSCSIParallelFamily-300.0.2.tar.gz";
    sha256 = "0k1phf0kr11zvi83w2c3d22m93b9y82740a2zl570bvl65ww9sw1";
  };
  "IOSerialFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOSerialFamily/IOSerialFamily-64.1.1.tar.gz";
    sha256 = "1sjll06vjsb0vr7g67789rmscjmqwazscvklg813w83b0kyddqsp";
  };
  "IOStorageFamily" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOStorageFamily/IOStorageFamily-172.tar.gz";
    sha256 = "0rd7aarz32gwzs5a94c29jd2b3nr8v183b1k97q06jidlhibdppq";
  };
  "IOUSBMassStorageClass" = fetchzip {
    url = "http://opensource.apple.com/tarballs/IOUSBMassStorageClass/IOUSBMassStorageClass-360.0.3.tar.gz";
    sha256 = "01sf7bsa2qsikfqiv7lhbf0g45pqwslwjvshlabkyk02xxc7pc3r";
  };
  "JavaScriptCore" = fetchzip {
    url = "http://opensource.apple.com/tarballs/JavaScriptCore/JavaScriptCore-7537.74.4.tar.gz";
    sha256 = "16dhlgdwpr4knw211pp8hg9a1qykh4r2crx6qfnan5sp1msxd2pg";
  };
  "KerberosHelper" = fetchzip {
    url = "http://opensource.apple.com/tarballs/KerberosHelper/KerberosHelper-148.tar.gz";
    sha256 = "13kbyhz00grhywwr3l3m2jkvjslyr4rav9vaa7bi54ai2iv2ca90";
  };
  "Libc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Libc/Libc-997.90.3.tar.gz";
    sha256 = "1xchgxkxg5288r2b9yfrqji2gsgdap92k4wx2dbjwslixws12pq7";
  };
  "Libinfo" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Libinfo/Libinfo-449.1.3.tar.gz";
    sha256 = "1lw4apjwibq52xyiib61m0byxxzg0ay52xz7583kaa3cxilk9r3w";
  };
  "Libnotify" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Libnotify/Libnotify-121.tar.gz";
    sha256 = "0rj7mkpbx1kpmn6gj8nxx558lxcgipcz2zy10ki3c66zwd5hq02v";
  };
  "Librpcsvc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Librpcsvc/Librpcsvc-23.tar.gz";
    sha256 = "0n4v97prn9xq7qhz0hpwm526dg1rxnm5xb0a759lk72ng23y7m9v";
  };
  "Libsystem" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Libsystem/Libsystem-1197.1.1.tar.gz";
    sha256 = "1iszd84cxc3ix3nhv29if8gn3ymhgmx03r03j6r1d8fp33xbr2qd";
  };
  "Liby" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Liby/Liby-20.tar.gz";
    sha256 = "0q2lmbyx3jz6bzrkf9rjqbr89k65xspyb6pn35gx5wisbc0imx3n";
  };
  "MITKerberosShim" = fetchzip {
    url = "http://opensource.apple.com/tarballs/MITKerberosShim/MITKerberosShim-62.1.tar.gz";
    sha256 = "0rs4r4q5arhgidjwjmj3pz2d135m79q994c71hbydmm5wz35bzm8";
  };
  "NFS" = fetchzip {
    url = "http://opensource.apple.com/tarballs/NFS/NFS-81.tar.gz";
    sha256 = "000a4pcr7m022gbq8mqjd8b0rwnnvcv0hvx2x9bwr3hiyr05lvgz";
  };
  "OpenAL" = fetchzip {
    url = "http://opensource.apple.com/tarballs/OpenAL/OpenAL-52.1.tar.gz";
    sha256 = "0a6hccpwlz0a6nrk4a2ci91lv6h003p8bgjijlwf805bq7ms5w79";
  };
  "OpenLDAP" = fetchzip {
    url = "http://opensource.apple.com/tarballs/OpenLDAP/OpenLDAP-491.1.tar.gz";
    sha256 = "1796lzzyz7zqwanmg5f23cjmx7z6g0m2c3j646a3aiflnb76vzra";
  };
  "OpenPAM" = fetchzip {
    url = "http://opensource.apple.com/tarballs/OpenPAM/OpenPAM-20.tar.gz";
    sha256 = "0cyhx387hnj79l4cy1r65glciqj3875p05qv0a6kq6lnafhlaza0";
  };
  "OpenSSH" = fetchzip {
    url = "http://opensource.apple.com/tarballs/OpenSSH/OpenSSH-186.tar.gz";
    sha256 = "0m2inpn8kffwy66368gii33brn98bk2jsdrxcj5rlk14750l6adq";
  };
  "PostgreSQL" = fetchzip {
    url = "http://opensource.apple.com/tarballs/PostgreSQL/PostgreSQL-97.tar.gz";
    sha256 = "1dqf620wcw253i3nr2jr455lqb8mfij3gqix2af2yrm5pqhrjdj6";
  };
  "PowerManagement" = fetchzip {
    url = "http://opensource.apple.com/tarballs/PowerManagement/PowerManagement-420.90.1.tar.gz";
    sha256 = "0mlgidhl295px85bdg1c5kvz2rq6441h4jdcv4h3s77b2jfd2lvs";
  };
  "PyRSS2Gen" = fetchzip {
    url = "http://opensource.apple.com/tarballs/PyRSS2Gen/PyRSS2Gen-5.tar.gz";
    sha256 = "1m66s5x4b6y745dxyp9fc09wbv73brghsbb0ql2chvmcmxr1jpw5";
  };
  "RubyCocoa" = fetchzip {
    url = "http://opensource.apple.com/tarballs/RubyCocoa/RubyCocoa-80.tar.gz";
    sha256 = "15hxxc3587g1ks5cwakwxhq88jis4x41n0rw0za4h9zjj1zsz1cy";
  };
  "RubyGems" = fetchzip {
    url = "http://opensource.apple.com/tarballs/RubyGems/RubyGems-24.tar.gz";
    sha256 = "1kynglq0xcn64w715wx3gsysfv4qn2xzl3dxd7rhhh7644a3zxpr";
  };
  "Security" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Security/Security-55471.14.tar.gz";
    sha256 = "03fj78af3ymazhd84q4w2x2q4r74425ggklsf0zdk9ndw1g6j1ab";
  };
  "SecurityTokend" = fetchzip {
    url = "http://opensource.apple.com/tarballs/SecurityTokend/SecurityTokend-55107.tar.gz";
    sha256 = "0fpx52g67h5l3jcv7w6xm0b812fjlgg0v5wvlc4k8rvwprgnh1ma";
  };
  "SecurityTool" = fetchzip {
    url = "http://opensource.apple.com/tarballs/SecurityTool/SecurityTool-55115.tar.gz";
    sha256 = "0i7vrvhcapnjmms94zh9wml4ny72mcl7mf2capg6j4rcipbdj3j6";
  };
  "SmartCardServices" = fetchzip {
    url = "http://opensource.apple.com/tarballs/SmartCardServices/SmartCardServices-55111.tar.gz";
    sha256 = "1kciyz2ygq564smhkyf9zz53rmnkfba8iqrzwy5r0ydpmcl066m5";
  };
  "SmartcardCCID" = fetchzip {
    url = "http://opensource.apple.com/tarballs/SmartcardCCID/SmartcardCCID-55005.tar.gz";
    sha256 = "1v5hf2ycjzxgcr7r9ki5p7gwxbgxpgwv9l9cbb2hjbh3dlj0la47";
  };
  "TimeZoneData" = fetchzip {
    url = "http://opensource.apple.com/tarballs/TimeZoneData/TimeZoneData-56.tar.gz";
    sha256 = "10sz2s14bwclw92l41p9ifz2rdm8xdfcwyijq1zprk0dck4y3xql";
  };
  "Twisted" = fetchzip {
    url = "http://opensource.apple.com/tarballs/Twisted/Twisted-16.tar.gz";
    sha256 = "0j2k1b5kjqx642xy4pdmgc14ldlaixqad6d71xw4zc0rvmx7312a";
  };
  "UserNotification" = fetchzip {
    url = "http://opensource.apple.com/tarballs/UserNotification/UserNotification-28.tar.gz";
    sha256 = "1q8hza4vfgks0jr1ffjgsa7z01jkxsbpl0y19g4fkgqpb1mr84ii";
  };
  "WebCore" = fetchzip {
    url = "http://opensource.apple.com/tarballs/WebCore/WebCore-7537.74.11.tar.gz";
    sha256 = "1jmaqjrsn6sqqcfn153rmp8dfhwz6s1khih2jm3hw6jqk0r46vhz";
  };
  "WebKit" = fetchzip {
    url = "http://opensource.apple.com/tarballs/WebKit/WebKit-7537.74.9.tar.gz";
    sha256 = "0vx2jabixd8j61xgdkzv1nxldpkk567h0b782il5fvzh1x7msvjr";
  };
  "WebKit2" = fetchzip {
    url = "http://opensource.apple.com/tarballs/WebKit2/WebKit2-7537.74.9.tar.gz";
    sha256 = "0cchh0y7gbpfhca10fn1alwjiylgqmdy0plwxqs3120fxli4m46i";
  };
  "adv_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/adv_cmds/adv_cmds-153.tar.gz";
    sha256 = "0bndas8ggamhd5wrcbhqpghkkfyxvmh0mp52lqh9axjgsr8fpr08";
  };
  "apache" = fetchzip {
    url = "http://opensource.apple.com/tarballs/apache/apache-786.1.tar.gz";
    sha256 = "06073qlg05qmc32p7cvjagih5xwnpjr8d2pp9vps4z74cfhzyfmx";
  };
  "apache_mod_hfs_apple" = fetchzip {
    url = "http://opensource.apple.com/tarballs/apache_mod_hfs_apple/apache_mod_hfs_apple-14.tar.gz";
    sha256 = "1a54yd50qjicldhdzix6x92rnqh09q4v8hfc601s9zwmlb65gkh8";
  };
  "apache_mod_perl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/apache_mod_perl/apache_mod_perl-108.tar.gz";
    sha256 = "15l5nf13hwx5lx59hlfizx00wjdvjqri2m21vlzlziiwzliajax0";
  };
  "apache_mod_php" = fetchzip {
    url = "http://opensource.apple.com/tarballs/apache_mod_php/apache_mod_php-87.2.tar.gz";
    sha256 = "03jsavqsdzp8jdy24jcd3m7sj31zazz7zs3zmwb3dqkd1b910jb9";
  };
  "apr" = fetchzip {
    url = "http://opensource.apple.com/tarballs/apr/apr-30.tar.gz";
    sha256 = "0lg9ynn6dxnfd37a7dhcdc8zxvnbb2cw968hd3c0i3wi32c8wmpb";
  };
  "architecture" = fetchzip {
    url = "http://opensource.apple.com/tarballs/architecture/architecture-265.tar.gz";
    sha256 = "16sngbdyfd94a1ki414ddfgfzs61a8wc50wcknm91rzvb5kmj9cq";
  };
  "autofs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/autofs/autofs-234.tar.gz";
    sha256 = "1l3i9y9l5k9lipcdpfwnd2ikyyyljbry1x23bdpb3cr0d33ks8l4";
  };
  "awk" = fetchzip {
    url = "http://opensource.apple.com/tarballs/awk/awk-18.tar.gz";
    sha256 = "0xcqy03n9jvvgypg0nylmiry7byz96v1jw80qrrjr8k73wricm3j";
  };
  "bash" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bash/bash-92.tar.gz";
    sha256 = "0f0p8zphzwaakf5myjbl24440nh328wzwxf66rxshsdr6ckl17zp";
  };
  "basic_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/basic_cmds/basic_cmds-55.tar.gz";
    sha256 = "1dq7z6hhhfynnyhyndrq56zmzgg3y2v1h1kqfw9lr73rzf32wyfm";
  };
  "bc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bc/bc-21.tar.gz";
    sha256 = "15qk7f0j2vhvf3slpzkxw5nhc5yd5pvy44ar4pm0lzrg88f0yj65";
  };
  "bind9" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bind9/bind9-45.100.tar.gz";
    sha256 = "1lifja50g6d7kaq7q4jd02qbk51sjk3xm6qcs3q7ghan4jjyjz6j";
  };
  "bless" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bless/bless-98.tar.gz";
    sha256 = "0f53z988iclpvl56cym5l806w2fb41dj3z4kdsh9200abrjfz0b4";
  };
  "bootp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bootp/bootp-268.1.tar.gz";
    sha256 = "0am72bkk2s2c82xlwj59w351i68aksas06aqarb24xsd0bgcnck7";
  };
  "bzip2" = fetchzip {
    url = "http://opensource.apple.com/tarballs/bzip2/bzip2-29.tar.gz";
    sha256 = "1qsb6303817qkvdik81qpx676bgxji062wkqp2lkjs3kccy4ymxg";
  };
  "cctools" = fetchzip {
    url = "http://opensource.apple.com/tarballs/cctools/cctools-845.tar.gz";
    sha256 = "1a6b7nvicmsjcwfjwci09fwiamp99jabzqgrxiyhlcdjsxgypvd2";
  };
  "cddafs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/cddafs/cddafs-252.tar.gz";
    sha256 = "13ipgy3pnzqx70p8fvaxcizjr9svmrvg34gq57byx3749xikjsjf";
  };
  "configd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/configd/configd-596.13.tar.gz";
    sha256 = "0v5ii5kch4x0bgyj2xhy4rzbbipm9pkrm6y1p1lbkrshy14i6pv6";
  };
  "copyfile" = fetchzip {
    url = "http://opensource.apple.com/tarballs/copyfile/copyfile-103.tar.gz";
    sha256 = "10q07aiaawqs21wg6jx2x5686p7jhhsf294v12b8vnl5ik25mbrp";
  };
  "cron" = fetchzip {
    url = "http://opensource.apple.com/tarballs/cron/cron-39.tar.gz";
    sha256 = "0vm0m6hdc7dlfrff3613yq2g0zb2sixqp8ghvylil2fbb7rrhw0v";
  };
  "crontabs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/crontabs/crontabs-51.tar.gz";
    sha256 = "1z29spr268hwxgvhlkfdsdpwz02h9hsskmysxzirrhgpbf73fya7";
  };
  "cups" = fetchzip {
    url = "http://opensource.apple.com/tarballs/cups/cups-372.2.tar.gz";
    sha256 = "1v65hiqy1a84xrsx2pydx3s16i3lkvcf7zhd72jc4rvjycpp0s5s";
  };
  "curl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/curl/curl-78.90.1.tar.gz";
    sha256 = "0hq5vnnxlkglaj3hrn2pmsjhafdbk1qgl75fpnzqki94gfa2343q";
  };
  "cxxfilt" = fetchzip {
    url = "http://opensource.apple.com/tarballs/cxxfilt/cxxfilt-11.tar.gz";
    sha256 = "0as10sqpz70siymlz33y09265xi1fwiy3gkcm01pwb52fm6kmyb3";
  };
  "dcerpc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/dcerpc/dcerpc-58.tar.gz";
    sha256 = "178ji8rxpzmfbsa0dlckwnj3vj255vm7gbgzpz79ch7f6vmhjc1q";
  };
  "diskdev_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/diskdev_cmds/diskdev_cmds-572.1.1.tar.gz";
    sha256 = "1qybqfjdfvc9fhc6g3vlpqcjc3ggdfyq9m0fxdlglai6kaiqjhh0";
  };
  "disklabel" = fetchzip {
    url = "http://opensource.apple.com/tarballs/disklabel/disklabel-6.tar.gz";
    sha256 = "0hknvk79pvdkf88nj0aasv1c1iyi80ia8da8hh29sfvh8lwakjhc";
  };
  "doc_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/doc_cmds/doc_cmds-49.tar.gz";
    sha256 = "0bvwlqpns3yi3653nviicngc6yh61dznqjglwnp1fdgx96apmyqy";
  };
  "dtrace" = fetchzip {
    url = "http://opensource.apple.com/tarballs/dtrace/dtrace-118.1.tar.gz";
    sha256 = "06dph04d6calk16g2m8fq4n2mlalxl3hkqaigm02z8m7h0sw4ibs";
  };
  "dyld" = fetchzip {
    url = "http://opensource.apple.com/tarballs/dyld/dyld-239.4.tar.gz";
    sha256 = "12g88bc1qa5ji9ql1c4j0gv5vq4i1vj0z1rzjlqphrdvcbsqqj0q";
  };
  "eap8021x" = fetchzip {
    url = "http://opensource.apple.com/tarballs/eap8021x/eap8021x-180.tar.gz";
    sha256 = "0hds706h3lh87d494rnj00312623is0k3dnv0dclbrv4zqpkch85";
  };
  "efax" = fetchzip {
    url = "http://opensource.apple.com/tarballs/efax/efax-36.tar.gz";
    sha256 = "0rf0sds6bhdn5s5ijjc6p3ayy8syc07sjwy6p3zspbz6p9fkqb0p";
  };
  "emacs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/emacs/emacs-92.tar.gz";
    sha256 = "09mqbyci5cc0imkx8sgnmkmryhlb2z2r9h74ip60hg778vf8rzzs";
  };
  "expat" = fetchzip {
    url = "http://opensource.apple.com/tarballs/expat/expat-12.tar.gz";
    sha256 = "0ilcwqxz67p2xrqcaj6wl59bbi8732rs9ni3m5yn3b7drr02n8jp";
  };
  "file" = fetchzip {
    url = "http://opensource.apple.com/tarballs/file/file-46.tar.gz";
    sha256 = "0bn17dfaxiyk5x52k64s1ryrypgcxsghqdfz6phy0siljgqg6nv5";
  };
  "file_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/file_cmds/file_cmds-230.tar.gz";
    sha256 = "12dsj1lvhkvmya737nl91kpvzdgdk8ff11agg97fwy16qcxzzy7c";
  };
  "files" = fetchzip {
    url = "http://opensource.apple.com/tarballs/files/files-638.1.4.tar.gz";
    sha256 = "0cvpq45a2bfvcspb5dbml891pbpyhqdk5bfaz1hb39nn10gvw9zj";
  };
  "gnudiff" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gnudiff/gnudiff-19.tar.gz";
    sha256 = "1fnwlpx4pk32znnqzfh9pizw4vbiq6jcj29k4paav97ym8506i7b";
  };
  "gnuserv" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gnuserv/gnuserv-7.tar.gz";
    sha256 = "0a03gs2bylbmlw95i495x8r0ppfsqxfg454rllqj6vagmplrxcg3";
  };
  "gnutar" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gnutar/gnutar-452.tar.gz";
    sha256 = "17cqpbwngsrp2k3snzb7fqs3bj57z1ra0sxb554kj57p8xcaamd7";
  };
  "gpatch" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gpatch/gpatch-3.tar.gz";
    sha256 = "127d02bs8dm353pl0vjxxv14p35gvk9qvw62r7z6bzhkhp9hs085";
  };
  "gpt" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gpt/gpt-12.tar.gz";
    sha256 = "11a15bv68mdm8665pckxxz5qxg97qyhncirdx0b97cwx2jkid2dz";
  };
  "groff" = fetchzip {
    url = "http://opensource.apple.com/tarballs/groff/groff-38.tar.gz";
    sha256 = "1cqk3cvymvg0ij7ainf0da0y1m542g0f1xls5vp2bmc1gba7l0sa";
  };
  "gssd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/gssd/gssd-62.tar.gz";
    sha256 = "1ixzpnv0rxasc79mrgdkh2nq0a3ga0f4m0z69l9iyf5iwqq7wfic";
  };
  "hfs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/hfs/hfs-226.1.1.tar.gz";
    sha256 = "0qz02gqacalzlg13qzhg926rwxrcaf7zbkgriwzjgml1p5ianzr5";
  };
  "hunspell" = fetchzip {
    url = "http://opensource.apple.com/tarballs/hunspell/hunspell-9.tar.gz";
    sha256 = "0jdfn4bjpmccnixr7wdxc4qmg60xb0b2x2jwzyanz9pfk2k36rd4";
  };
  "iodbc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/iodbc/iodbc-42.5.tar.gz";
    sha256 = "1hfwk03cbscxyaxc6syg3k96r8p4kdvjdidq9gbk0043i1dd6416";
  };
  "ipsec" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ipsec/ipsec-258.90.2.tar.gz";
    sha256 = "16r60hzlbgb144p2x2bmzzwcyn481v5sf873cfd1cq3f42jgbdzp";
  };
  "kext_tools" = fetchzip {
    url = "http://opensource.apple.com/tarballs/kext_tools/kext_tools-326.90.2.tar.gz";
    sha256 = "0cja6f20186j2dp4v6vfl20q5xv3ip1dm7lby3qan26yqfpjqa6w";
  };
  "keymgr" = fetchzip {
    url = "http://opensource.apple.com/tarballs/keymgr/keymgr-28.tar.gz";
    sha256 = "1ragjbl27ijdckbjmqr51mlc9c3b2fmr52cj90i33h2f4zhyp125";
  };
  "ksh" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ksh/ksh-20.tar.gz";
    sha256 = "0c791969jfi8w518njnbaipv8j2sa9knrlslxvmkzsfijk6rmahn";
  };
  "launchd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/launchd/launchd-842.90.1.tar.gz";
    sha256 = "09sb2iqkd2ys9nwmiwyiliagmil75y40pd9z8q6nx37jpdrjx742";
  };
  "less" = fetchzip {
    url = "http://opensource.apple.com/tarballs/less/less-23.tar.gz";
    sha256 = "0z6bi12s1j8igl6b9npnpz8vkssic3g9zx85jy26s9qbplrfsjrz";
  };
  "libarchive" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libarchive/libarchive-29.tar.gz";
    sha256 = "0yf5n8hl6xdmjvcscymm9qhc3j9a2lxw0m0s3ampkvsld0d3n9fc";
  };
  "libauto" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libauto/libauto-185.5.tar.gz";
    sha256 = "0fx8fck62ckfj1029a0ynfi8094sq2k5p444ga9kqx877j68kigz";
  };
  "libclosure" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libclosure/libclosure-63.tar.gz";
    sha256 = "0bkqpflpwc71bilib3c7sh3pb4kx97avq6vqy4cajbl39yaddyld";
  };
  "libdispatch" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libdispatch/libdispatch-339.90.1.tar.gz";
    sha256 = "039zjk7992q5z1raslshfcd0ax9606lnzkykjyyx141hzgss58zz";
  };
  "libedit" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libedit/libedit-39.tar.gz";
    sha256 = "13drz5hj40gfy9a004jjksmq9hk3fwjkxbq79d4yqnvfs2n4ls2q";
  };
  "libevent" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libevent/libevent-7.tar.gz";
    sha256 = "0zsv49mwgx2vm35bcgs4zbivwj36cqy68gqjz8h61jr2qf4wgxp4";
  };
  "libffi" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libffi/libffi-18.1.tar.gz";
    sha256 = "0bynwwk82yskkpr6bighsznwn6crk5q96ligpjbbbm91g07whw29";
  };
  "libfs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libfs/libfs-13.tar.gz";
    sha256 = "1sphlskmflypzjzcdap9jg3iq13dv1j6np653wibhbci14l9y7sf";
  };
  "libgcc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libgcc/libgcc-13.tar.gz";
    sha256 = "14ryyf64c6v05kyh83g9wklskbm3wp52xr21hyz03mpbw1z07gnx";
  };
  "libiconv" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libiconv/libiconv-41.tar.gz";
    sha256 = "1ppvcsh37xjm62m617wq23k50qzm2013rxfd73z0qmhc6q2nfg5i";
  };
  "libpcap" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libpcap/libpcap-42.tar.gz";
    sha256 = "0glad5blpkjnal44y0ni4ibb76bjy68apc98hawg65w7rkp55lsy";
  };
  "libresolv" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libresolv/libresolv-54.tar.gz";
    sha256 = "18243bprsncg95lrgghq7dzl5liy5rwyidnvaxi0jrrrbah9iwbj";
  };
  "libsecurity_agent" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libsecurity_agent/libsecurity_agent-55000.tar.gz";
    sha256 = "0nj5j6k5nlm4pwbdysa68klq7bxs3kkqxklg7xmgzdmypgw48vrn";
  };
  "libsecurity_ldap_dl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libsecurity_ldap_dl/libsecurity_ldap_dl-55002.tar.gz";
    sha256 = "03l54pwzklcmx1y1nbas8lzgzpyp8hha5ccv10njfh0375x0gfbm";
  };
  "libstdcxx" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libstdcxx/libstdcxx-60.tar.gz";
    sha256 = "1znsc336qjg62bfir8r518xgxg7g913g19p20fjbb1piy96mibhg";
  };
  "libtelnet" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libtelnet/libtelnet-13.tar.gz";
    sha256 = "1h91iz9w8hwxbmf9vgqlvlc6qm4bk6lb8ffhg42w4jss6yqw5d0g";
  };
  "libunwind" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libunwind/libunwind-35.3.tar.gz";
    sha256 = "01c0djvcybm59cqjwn5aysajdi5pb1qgp1m2d57fjyv900vkh0cr";
  };
  "libutil" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libutil/libutil-34.tar.gz";
    sha256 = "03wcx4crf1k5i75sim2is5z9khlc0ixkcvf9x017y85rcnl5kmsa";
  };
  "libxml2" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libxml2/libxml2-26.tar.gz";
    sha256 = "0g4cnkxxbgsk32k0m85jzyix5dxnwans278wm2svb9a97kwqm26p";
  };
  "libxslt" = fetchzip {
    url = "http://opensource.apple.com/tarballs/libxslt/libxslt-13.tar.gz";
    sha256 = "08gjipwr68kw4m4k9ywp6q7g0j4bwc7368qnxmx0v7zn4jzra8im";
  };
  "llvmCore" = fetchzip {
    url = "http://opensource.apple.com/tarballs/llvmCore/llvmCore-3425.0.33.tar.gz";
    sha256 = "0sh6il995ivp0p38ar7hlddb2p7qknqp51k0n8x6fdrhnc8hhpy6";
  };
  "lsof" = fetchzip {
    url = "http://opensource.apple.com/tarballs/lsof/lsof-52.tar.gz";
    sha256 = "1rf8ags9rydxjn5b9cpnf2ywcbmfmiza6sqybgf3ld2d18gqjvpi";
  };
  "lukemftp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/lukemftp/lukemftp-13.tar.gz";
    sha256 = "0m5pliiz127dl06kh328422l9lnkprp462z53k4sq7nqdwcy16fx";
  };
  "lukemftpd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/lukemftpd/lukemftpd-50.tar.gz";
    sha256 = "0073z5212xzpjmvzqzfjzn4kxahc4mq9qamlkp9071fjwpjfkn7x";
  };
  "mDNSResponder" = fetchzip {
    url = "http://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-522.90.2.tar.gz";
    sha256 = "02lc4y2iyq7bihqpr3q7avkmd238xxpqjcczdm7ma509s4xjbibp";
  };
  "mail_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/mail_cmds/mail_cmds-29.tar.gz";
    sha256 = "1ra55znf4pppszcds8v8djfn03ycjsd0wb2cdx5lrw6f1ys3qlpx";
  };
  "man" = fetchzip {
    url = "http://opensource.apple.com/tarballs/man/man-16.tar.gz";
    sha256 = "106pwpn6765g0i5j73v4k28bwr8lrjgpm16a1xqkl60rn4x6392k";
  };
  "memcached" = fetchzip {
    url = "http://opensource.apple.com/tarballs/memcached/memcached-9.tar.gz";
    sha256 = "0bk3jbw4gfca6036a8cmabaxxh5mskgxqfz0yjn6df6ab07qs0xz";
  };
  "misc_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/misc_cmds/misc_cmds-32.tar.gz";
    sha256 = "1i4l3yxbr63d6hd7lj16m8dh9p3d84gy2r5y38f105yb7x0r0gnx";
  };
  "modemccl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/modemccl/modemccl-25.1.tar.gz";
    sha256 = "13mnfqwiavgvlh1wpb2z0l802dqp70x885y2cc6ddkcv8ffaqwf3";
  };
  "msdosfs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/msdosfs/msdosfs-198.tar.gz";
    sha256 = "10mrz0qllxkadfcrkdw5lhipwx77apzky35ygv994si2hc1sp259";
  };
  "nano" = fetchzip {
    url = "http://opensource.apple.com/tarballs/nano/nano-11.tar.gz";
    sha256 = "1rnf6pl4qrrvj51fdvissf63l1ag5246k027n95624v6i5yqn4c1";
  };
  "ncurses" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ncurses/ncurses-42.tar.gz";
    sha256 = "0lxcp88phhsp8yzwabg606vhv58jijq4s7m3yqb4wj5608ip16cb";
  };
  "net_snmp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/net_snmp/net_snmp-140.1.tar.gz";
    sha256 = "0bpxq84kf8nqkn4zqcc0vczd6akabn8ckhnnabrn4mr8f4956pn1";
  };
  "netcat" = fetchzip {
    url = "http://opensource.apple.com/tarballs/netcat/netcat-20.tar.gz";
    sha256 = "12cqlmp2x8rp94a9lvv096f92r05lrpaxns41vms0hxyyznrh8rl";
  };
  "network_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/network_cmds/network_cmds-433.tar.gz";
    sha256 = "12fyhn1m5b5wwqw72fjk77pks107kxwp6f67rgnvd6sppj1p1xvs";
  };
  "ntfs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ntfs/ntfs-83.tar.gz";
    sha256 = "1s5wh237kywvp44zjl3mymxbby0ncjglxcfy5srd3pxlb6n4bgx6";
  };
  "ntp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ntp/ntp-88.tar.gz";
    sha256 = "0q90jqklx46zykzv9xg7vjxmwgp9yg8d79qf8cp5cxsfb82hgvg8";
  };
  "objc4" = fetchzip {
    url = "http://opensource.apple.com/tarballs/objc4/objc4-551.1.tar.gz";
    sha256 = "036jg7sp0vjwn2srx7axmjw7gm3r6cww0bikhxi9hc9d2fpw94hp";
  };
  "pam_modules" = fetchzip {
    url = "http://opensource.apple.com/tarballs/pam_modules/pam_modules-138.tar.gz";
    sha256 = "1jr9nrizjmkyabfa3z5mmnb64swcmf37k3k251vhpbx92cwly8b4";
  };
  "passwordserver_sasl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/passwordserver_sasl/passwordserver_sasl-170.tar.gz";
    sha256 = "0yk2k5vhvqr80myv6n9yiz2khzgxlxb5zpqqxsbam5hhdccwyx56";
  };
  "patch_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/patch_cmds/patch_cmds-17.tar.gz";
    sha256 = "1cxsbj4l8g4xyazmblapdgxaa918fxda8xrknm463gsyp3kax03m";
  };
  "pcre" = fetchzip {
    url = "http://opensource.apple.com/tarballs/pcre/pcre-7.tar.gz";
    sha256 = "17lf561zx0zca0q7v9vaxp7zgk768y2v64d8l2jj1jb3by0qcc85";
  };
  "pdisk" = fetchzip {
    url = "http://opensource.apple.com/tarballs/pdisk/pdisk-9.tar.gz";
    sha256 = "0yvlxkqx1axin2rr8pvbrkp8fik9wlz6pms92c3y33pm9yg6007s";
  };
  "perl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/perl/perl-92.tar.gz";
    sha256 = "08lln68yr7k3vnr87ml5q6amskabj9hlh8qfny9z8cdys3xq6d3b";
  };
  "postfix" = fetchzip {
    url = "http://opensource.apple.com/tarballs/postfix/postfix-252.tar.gz";
    sha256 = "1cdi29038zkgrya9xiq3575bhzc80cnjys1jb08chmcnravmbkls";
  };
  "ppp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ppp/ppp-727.90.1.tar.gz";
    sha256 = "089hvgnrfkzz39g6f1wich0smq8ad0sz46vh351v0vyy65n92bp3";
  };
  "procmail" = fetchzip {
    url = "http://opensource.apple.com/tarballs/procmail/procmail-14.tar.gz";
    sha256 = "11ahqkgdlzrbbxq8gkbmn5lk40n2c07walnwnqw00k0cd60jrz2v";
  };
  "pyOpenSSL" = fetchzip {
    url = "http://opensource.apple.com/tarballs/pyOpenSSL/pyOpenSSL-8.tar.gz";
    sha256 = "1pdax0vm815xwwa8z8f43fng8b506n9pviqznvhia1jb50h1is6v";
  };
  "pyobjc" = fetchzip {
    url = "http://opensource.apple.com/tarballs/pyobjc/pyobjc-42.tar.gz";
    sha256 = "0k7w59f3kznyh7d5rcqdrsyzfrkss14cli6anx3f9ds4hcgvaj6w";
  };
  "python" = fetchzip {
    url = "http://opensource.apple.com/tarballs/python/python-76.tar.gz";
    sha256 = "1yxff9424b6yz1bzbfk9pjab10gsgd6xd00p7jkflqikyaaz633r";
  };
  "python23" = fetchzip {
    url = "http://opensource.apple.com/tarballs/python23/python23-21.tar.gz";
    sha256 = "1z1rq2c1a7265r0yf2xi4cl5923qlyssv0hpw2gysbc27waxpcvy";
  };
  "python_dateutil" = fetchzip {
    url = "http://opensource.apple.com/tarballs/python_dateutil/python_dateutil-5.tar.gz";
    sha256 = "1d70jfk1knipv49dpk4jnjcd66sa5a9qcprkjmadf4kcri4mmg8f";
  };
  "python_modules" = fetchzip {
    url = "http://opensource.apple.com/tarballs/python_modules/python_modules-35.tar.gz";
    sha256 = "1lkv92si2rlj0yldkznkrjvd6f0b65kr1n7j08zvl63q09gnjjga";
  };
  "remote_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/remote_cmds/remote_cmds-41.90.1.tar.gz";
    sha256 = "0p3m7jn303r33rkqf47n7b4j7qjr0bkjv0g6jv3jyg7xdc6z2dx4";
  };
  "removefile" = fetchzip {
    url = "http://opensource.apple.com/tarballs/removefile/removefile-33.tar.gz";
    sha256 = "05xslhhn5ki88xfwk12png389mr5hysja2hq19qagxjv4c0wzjfs";
  };
  "rsync" = fetchzip {
    url = "http://opensource.apple.com/tarballs/rsync/rsync-42.tar.gz";
    sha256 = "1s6hhnbvmw50h2y424zpdihq2vvj2grs9jv9cyn8hy8nimvba7dw";
  };
  "ruby" = fetchzip {
    url = "http://opensource.apple.com/tarballs/ruby/ruby-96.tar.gz";
    sha256 = "1fv1w34l3g4d2jvsd4fhlcsxj1qcgpqbb7xkcrrcycmsd4kp3wrq";
  };
  "screen" = fetchzip {
    url = "http://opensource.apple.com/tarballs/screen/screen-22.tar.gz";
    sha256 = "0rjh16p1wc8csgv2d85in8ximnzdddz7dhnpbhp8jxszarx4anvx";
  };
  "security_authtrampoline" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_authtrampoline/security_authtrampoline-55105.tar.gz";
    sha256 = "0yi3ss4ccshglmfhsvmvlx8kxv94zy1832j1zidwm5b40g669qdz";
  };
  "security_certificates" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_certificates/security_certificates-55036.1.tar.gz";
    sha256 = "169d56ydcq2r9yqixqwvm17a8ixkkr5vbi7ijrhnm6n5p87gf2vq";
  };
  "security_certtool" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_certtool/security_certtool-55105.tar.gz";
    sha256 = "09cvbzf3pb9xr0wkk12bzgwjwamyxkbkl31kc4bd9sqq7yq9rsfw";
  };
  "security_crlrefresh" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_crlrefresh/security_crlrefresh-55102.tar.gz";
    sha256 = "1m7g800ij63iabww1p0nda2h50rjagbxgvzrgjpavi2r003sv02w";
  };
  "security_dotmac_tp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_dotmac_tp/security_dotmac_tp-55107.1.tar.gz";
    sha256 = "1rdq02mjil2d936z4kfnyzc1qnb1rx8l201m2d7kx5c87qsvdp7q";
  };
  "security_ocspd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_ocspd/security_ocspd-55118.2.tar.gz";
    sha256 = "0pabhll39md28la20q4z2c3rwmfki78l8r25lx4ray0bm8yd2vdc";
  };
  "security_systemkeychain" = fetchzip {
    url = "http://opensource.apple.com/tarballs/security_systemkeychain/security_systemkeychain-55191.tar.gz";
    sha256 = "04gi6akgcs32pnclns9fr3hy2swh44q79068rpv9l2zq9qqs79vp";
  };
  "securityd" = fetchzip {
    url = "http://opensource.apple.com/tarballs/securityd/securityd-55199.2.tar.gz";
    sha256 = "0qfyw4cv3jcxqwisasvw249qzin2lz4yvj50nd30ygvja3fmb262";
  };
  "shell_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/shell_cmds/shell_cmds-175.tar.gz";
    sha256 = "1a22l73yz03jc3qb4v0bp3fmpd9b7ccbzzqcjqx4yzg6pg7pz1z9";
  };
  "smb" = fetchzip {
    url = "http://opensource.apple.com/tarballs/smb/smb-697.90.9.tar.gz";
    sha256 = "1p2zflf9a3dc2s775zmb4kjzf1ksgfwngzhibrmbycpzbgilzrwp";
  };
  "srm" = fetchzip {
    url = "http://opensource.apple.com/tarballs/srm/srm-7.tar.gz";
    sha256 = "1d30wii337f68gaj3i98kms04ll97hm3ajgqzv26lr7ds2bgvjd4";
  };
  "sudo" = fetchzip {
    url = "http://opensource.apple.com/tarballs/sudo/sudo-72.tar.gz";
    sha256 = "1kdx118lb51id5ii900ladmz7p2ccp3bbfvkvkf12b1257mbzbg6";
  };
  "swig" = fetchzip {
    url = "http://opensource.apple.com/tarballs/swig/swig-10.tar.gz";
    sha256 = "0k5364g673a5bbksxz66imvq1yr30jsz5s1d9l65pg1j0fq62dny";
  };
  "syslog" = fetchzip {
    url = "http://opensource.apple.com/tarballs/syslog/syslog-217.1.4.tar.gz";
    sha256 = "1s4wwn58wy231pl28npaqyq4iyk50297jzh1v2kvzi54fcc6fk74";
  };
  "system_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/system_cmds/system_cmds-597.90.1.tar.gz";
    sha256 = "19jx3b48032qg2civs9p4l9i8v79wpzwjk7g2189mqy5q8m4453g";
  };
  "system_config" = fetchzip {
    url = "http://opensource.apple.com/tarballs/system_config/system_config-53.0.0.0.1.tar.gz";
    sha256 = "1mf1knfx2926xzpcdnf5sj2nzv75i2j3zv2hi71kb7iisgsfix73";
  };
  "tcl" = fetchzip {
    url = "http://opensource.apple.com/tarballs/tcl/tcl-102.tar.gz";
    sha256 = "0v2nl0rb6a1l4r0scq7nzizygg0ng405lzsganlggzbjkw6kj7w9";
  };
  "tcpdump" = fetchzip {
    url = "http://opensource.apple.com/tarballs/tcpdump/tcpdump-56.tar.gz";
    sha256 = "1kwni97d832q3rgds9a48zsmiy35kdz50x1p3man7c0dk3v59fql";
  };
  "tcsh" = fetchzip {
    url = "http://opensource.apple.com/tarballs/tcsh/tcsh-65.tar.gz";
    sha256 = "1wvvk1r0kf5bp260ws5fpwvmbvanm8j0m34amzw9q4q4i8aqhmwv";
  };
  "texinfo" = fetchzip {
    url = "http://opensource.apple.com/tarballs/texinfo/texinfo-18.tar.gz";
    sha256 = "04lcgf643v829p1n9xz9xfn26j4d0v4a1zw1444wygywcw6q9wp5";
  };
  "text_cmds" = fetchzip {
    url = "http://opensource.apple.com/tarballs/text_cmds/text_cmds-87.tar.gz";
    sha256 = "1kn9kndjr2a9aq8fj0knik43ri0y6zgqpcnja7sdfricmiqzdqi8";
  };
  "tidy" = fetchzip {
    url = "http://opensource.apple.com/tarballs/tidy/tidy-15.12.tar.gz";
    sha256 = "0vd93vc3g8zcaf2psh8kqn378p84pmd09lkqv8w0akam9rykhzmr";
  };
  "top" = fetchzip {
    url = "http://opensource.apple.com/tarballs/top/top-89.1.2.tar.gz";
    sha256 = "19kw7pykl73z3m9bkrb6m17llp6p9m6zlbh08sv6wwwa5xh1nq65";
  };
  "usertemplate" = fetchzip {
    url = "http://opensource.apple.com/tarballs/usertemplate/usertemplate-93.tar.gz";
    sha256 = "1mypzyfrjia2qsgd1ssqna43phz5v6inz4766myj3qzhsgh6nwzi";
  };
  "uucp" = fetchzip {
    url = "http://opensource.apple.com/tarballs/uucp/uucp-11.tar.gz";
    sha256 = "113gq9qj0b5s6r1y8jhrqw134gqnaxj3cklj2dgnqaijm82vvkcg";
  };
  "vim" = fetchzip {
    url = "http://opensource.apple.com/tarballs/vim/vim-53.tar.gz";
    sha256 = "14vly2qwwzqc6b7iprqpkz8qp1llk5y8kh30rfsgci0kglqzkzv6";
  };
  "webdavfs" = fetchzip {
    url = "http://opensource.apple.com/tarballs/webdavfs/webdavfs-352.90.1.tar.gz";
    sha256 = "1b5ws1c0y8d2sbcvrv1jbi1b3l2xxf20yka9p0zr2v501pylxszw";
  };
  "xar" = fetchzip {
    url = "http://opensource.apple.com/tarballs/xar/xar-202.tar.gz";
    sha256 = "0mbnipfn1i05walyilc5lir3yz552wabhkxmsh80kymds304n3ax";
  };
  "xnu" = fetchzip {
    url = "http://opensource.apple.com/tarballs/xnu/xnu-2422.90.20.tar.gz";
    sha256 = "15k12l5zrmg49m6lhypdm89h86m9xpl41gx9yijpx7bby3ssp946";
  };
  "zip" = fetchzip {
    url = "http://opensource.apple.com/tarballs/zip/zip-14.tar.gz";
    sha256 = "0hdsgp32349dnw2ixxv0zaxsjg3qpafkjkx43mx27f86v4zspvvy";
  };
  "zlib" = fetchzip {
    url = "http://opensource.apple.com/tarballs/zlib/zlib-53.tar.gz";
    sha256 = "0q1sdhikfkbi8fpp035zmq9042n44v6b473scyzxhcdnrj95b63p";
  };
  "zsh" = fetchzip {
    url = "http://opensource.apple.com/tarballs/zsh/zsh-60.tar.gz";
    sha256 = "1kiscx990livlpx7l64lhimlb3j15zhd27sp5djgf3mxngsxk9gy";
  };
}
