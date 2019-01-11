{ pkgs ? import <nixpkgs> {} }:
      
rec {
  tegola = callPackage ./pkgs/tegola { };

  modules = import ./modules;
} 
