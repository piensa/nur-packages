{ pkgs ? import <nixpkgs> {} }:
      
rec {
  tegola = pkgs.callPackage ./pkgs/tegola { };
#  geocatalogo = pkgs.callPackage ./pkgs/geocatalogo { };
#  jivan = pkgs.callPackage ./pkgs/jivan { };
  hydra = pkgs.callPackage ./pkgs/hydra { };
  keto = pkgs.callPackage ./pkgs/keto { };
  oathkeeper = pkgs.callPackage ./pkgs/oathkeeper { };
  logico = pkgs.callPackage ./pkgs/logico { };
#  packr = pkgs.callPackage ./pkgs/packr { };
  imposm = pkgs.callPackage ./pkgs/imposm { };
  blender = pkgs.callPackage ./pkgs/blender { };
  kepler = pkgs.callPackage ./pkgs/kepler { };
  fresco = pkgs.callPackage ./pkgs/fresco { };
  colombia = pkgs.callPackage ./pkgs/colombia { };
  puertico-osm = pkgs.callPackage ./pkgs/puertico-osm { };
  reva = pkgs.callPackage ./pkgs/reva { };
  dbxcli = pkgs.callPackage ./pkgs/dbxcli { };
  tippecanoe = pkgs.callPackage ./pkgs/tippecanoe { };
  caddy = pkgs.callPackage ./pkgs/caddy { };
  caddy2 = pkgs.callPackage ./pkgs/caddy2 { };
  bemenu = pkgs.callPackage ./pkgs/bemenu { };
  minio = pkgs.callPackage ./pkgs/minio { };
  minio-client = pkgs.callPackage ./pkgs/minio-client { };
#  jamaica = pkgs.callPackage ./pkgs/jamaica { };
#  modules = import ./modules;
} 
