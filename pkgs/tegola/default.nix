# This file was generated by https://github.com/kamilchm/go2nix v1.2.1
{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "tegola-unstable-${version}";
  version = "2018-11-09";
  rev = "98f044f54c984cde42eb2f375432e17d3134de14";

  goPackagePath = "github.com/go-spatial/tegola";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/go-spatial/tegola";
    sha256 = "0xqyiid2f6nz6ppqnmmb3kx65a7adcikcvphkrskxvjz8gwf2r7h";
  };

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}


