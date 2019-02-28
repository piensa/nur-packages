{ stdenv, fetchgit, coreutils, bash }:

stdenv.mkDerivation {
  name = "puertico-osm";
  builder = "${bash}/bin/bash"; args = [ ./builder.sh ];
  inherit coreutils;
  src = fetchgit { 
    url = "https://github.com/piensa/puertico-osm";
    sha256 = "0h1vb7l147rac1zp5bgwv1sn6krin4wzzkidpb82ywjabqmpkxn9";
  };
}

