{ stdenv, buildGoPackage, fetchgit, fetchhg, fetchbzr, fetchsvn }:

buildGoPackage rec {
  name = "consentido-unstable-${version}";
  version = "2019-02-27";
  rev = "8054399b7151331be45e4ece2df0d94e09f4f416";

  goPackagePath = "github.com/piensa/consentido";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/piensa/consentido";
    sha256 = "0qvqpmz751yb3msazxnmnpzqshf35zmbasydxphii0hlwa115jab";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
