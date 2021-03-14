{ pkgs ? import <nixpkgs> }:
let
  inherit (pkgs.stdenv) mkDerivation;
  inherit (builtins) getEnv;
in
rec {
  env = {
      XDG_CACHE_HOME = toString ./.cache;
  };
  cache = {
    scons = "$XDG_CACHE_HOME/scons";
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
      # mbedtls	# no .pc file
      # miniupnpc	# no .pc file
    ];
}
