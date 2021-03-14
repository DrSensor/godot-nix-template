{ pkgs ? import <nixpkgs> }:
let
  inherit (pkgs.stdenv) mkDerivation;
  inherit (builtins) getEnv;

  envPathLibs = with pkgs.lib;
    list: {
      LD_LIBRARY_PATH = concatStringsSep ":" (map (pkg: "${pkg}/lib") list);
      LINKFLAGS = concatStringsSep " " (map (pkg: "-L${pkg}/lib -I${pkg}/include") list);
      C_INCLUDE_PATH = concatStringsSep ":" (map (h: "${pkg}/include") list);
    };

in
{
  env = with pkgs;
    envPathLibs [ mbedtls miniupnpc ] // rec {
      XDG_CACHE_HOME = toString ./.cache;
      SCONS_CACHE = XDG_CACHE_HOME + "/scons";
    };

  libs = with pkgs; # list of shared libs for custom.py with `builtin_* = "no"`
    [
      bullet
      enet
      zstd
      libtheora
      libvpx
      opusfile
      libwebp
      pcre2
      mbedtls # no .pc file
      miniupnpc # no .pc file
    ];
}
