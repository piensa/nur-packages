{ yarn2nix, fetchgit }:

yarn2nix.mkYarnPackage {
  name = "fresco";


  preInstall = ''
    yarn build
  '';

  postInstall = ''
    ls $out/node_modules/fresco-app/build
    cp -r $out/node_modules/fresco-app/build/* $out/
    rm -rf $out/node_modules
    rm -rf $out/bin
  '';

  src = fetchgit {
    rev = "5b0a30d";
    url = "https://github.com/piensa/fresco";
    sha256 = "0p0fk5r5813hhsy2cyiz584yzdmwwda56a04apz9h3i88yhqi4wd";
  };

}
