{ stdenv, go, git, fetchgit, buildGoPackage }:

buildGoPackage rec {
  name = "hydra-unstable-${version}";
  version = "2019-01-03";
  rev = "e2b88d211a27d7b0aeff4b10f7140990133337bd";

  goPackagePath = "github.com/ory/hydra";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/ory/hydra";
    sha256 = "0h8f7yr7p5dqysccyfl8l22ib1yqxckfc58500dfi8c3zag05wgd";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
  };
}
