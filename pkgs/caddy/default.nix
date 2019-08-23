{ stdenv, go_1_12, buildGoPackage, fetchFromGitHub }:
let
  buildGoPackage12 = buildGoPackage.override { go=go_1_12; };
in buildGoPackage12 rec {
  name = "caddy-${version}";
  version = "2";
  goPackagePath = "github.com/caddyserver/caddy";
  goDeps = ./deps.nix;
  subPackages = [ "cmd/caddy" ];
  patches = [ ./fiximport.patch ];
  src = fetchFromGitHub {
    owner = "caddyserver";
    repo = "caddy";
    rev = "v${version}";
    sha256 = "12a8pnjhndhkbpkfm8nn61c0nxxn16dpcihsymcvax2jy5j2sq61";
  };
  modSha256 = "0h2r1jivcar924vv0lyablmjxzzarhkb8sjq8zi59dp34hcwpr08";

  buildFlagsArray = ''
    -ldflags=
      -X github.com/caddyserver/caddy/v2/caddy/caddymain.gitTag=v${version}
  '';

  meta = with stdenv.lib; {
    homepage = https://caddyserver.com;
    description = "Fast, cross-platform HTTP/2 web server with automatic HTTPS";
    license = licenses.asl20;
    maintainers = with maintainers; [ rushmorem fpletz zimbatm ];
  };
}
