{ yarn2nix, fetchgit }:

yarn2nix.mkYarnPackage {
  name = "fresco";

  preInstall = ''
    yarn build
  '';

  postInstall = ''
    cp $out/node_modules/fresco/* $out/
    rm -rf $out/node_modules
    rm -rf $out/bin
  '';

  src = fetchgit {
    rev = "5bc1171";
    url = "https://github.com/piensa/fresco";
    sha256 = "0kqs3f7fy1p48zj68i7wfid2ik3grpm5y2fwkxq7yy00ykfm05ig";
  };

}
