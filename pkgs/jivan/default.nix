{ stdenv, fetchgit, fetchhg, fetchbzr, fetchsvn }:
let
 oldpkgs = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/release-17.09.tar.gz) {};
 buildGo18Package = oldpkgs.buildGo18Package;
in
buildGo18Package rec {
  name = "jivan-unstable-${version}";
  version = "2018-03-28";
  rev = "5bf0b77";

  goPackagePath = "github.com/go-spatial/jivan";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/go-spatial/jivan";
    sha256 = "10gkqqf62h95p1x05v9j7a8kinc0myyqrccmh9qwzvcxpx9gm9lm";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
