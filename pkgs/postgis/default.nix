let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  pg = (pg:
      pkgs.buildEnv {
        name = "postgresql-and-plugins-${(builtins.parseDrvName pg.name).version}";
        paths = [ pg pg.lib (pkgs.postgis.override { postgresql = pg; }) ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          mkdir -p $out/bin
          rm $out/bin/{pg_config,postgres,pg_ctl}
          cp --target-directory=$out/bin ${pg}/bin/{postgres,pg_config,pg_ctl}
          wrapProgram $out/bin/postgres --set NIX_PGLIBDIR $out/lib
        '';
      }
    );

in stdenv.mkDerivation rec {
    name = "postgis-${version}";
    version = "0.0.1";
    buildInputs = [ (pg pkgs.postgresql100)]; 
}
