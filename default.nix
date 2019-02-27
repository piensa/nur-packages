{ pkgs ? import <nixpkgs> {} }:
      
rec {
  tegola = pkgs.callPackage ./pkgs/tegola { };
  hydra = pkgs.callPackage ./pkgs/hydra { };
  keto = pkgs.callPackage ./pkgs/keto { };
  oathkeeper = pkgs.callPackage ./pkgs/oathkeeper { };
  consentido = pkgs.callPackage ./pkgs/consentido { };
  packr = pkgs.callPackage ./pkgs/packr { };
  imposm = pkgs.callPackage ./pkgs/imposm { };
  blender = pkgs.callPackage ./pkgs/blender { };
  kepler = pkgs.callPackage ./pkgs/kepler { };
  fresco = pkgs.callPackage ./pkgs/fresco { };
  colombia = pkgs.callPackage ./pkgs/colombia { };
  jamaica = pkgs.callPackage ./pkgs/jamaica { };
  modules = import ./modules;
} 
