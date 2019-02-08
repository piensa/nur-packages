{ yarn2nix, fetchgit }:

yarn2nix.mkYarnPackage {
  name = "kepler";
  src = fetchgit {
    rev = "5620599c05672c1d04d256679d0ff969aa6d77bb";
    url = "https://github.com/uber/kepler.gl";
    sha256 = "16yn98clq90slcyiaj6qvbfcg1csisjs8gsrn6j0p79alf8lk2hq";
  };

}
