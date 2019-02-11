{ stdenv,  python2, nodePackages, nodejs, utillinux, runCommand, writeTextFile, fetchurl, fetchgit }:

let 
  nodeEnv = import ./node-env.nix {
    inherit stdenv python2 utillinux runCommand writeTextFile;
    inherit nodejs;
    libtool = null;
  };
  nodePackages = import ./node-packages.nix {
    inherit fetchurl fetchgit;
    inherit nodeEnv;
  };
  webpack = nodePackages.webpack;
in 
nodeEnv.buildNodePackage {
  packageName = "fresco";
  name = "fresco";
  version = "2019-02-07";
  dontNpmInstall = true;
  buildInputs = [  ];

  src = fetchgit {
    rev = "5c6be2353338e4fe481e1784a4c8fdf5f25ea17e";
    url = "https://github.com/go-spatial/fresco";
    sha256 = "15mrii51k8ba7apyxp721xp3214l5lxz5hh91yyzygyxvswyl0p4";
  };
}

