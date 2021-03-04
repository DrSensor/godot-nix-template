{ pkgs ? import <nixpkgs> {}
, system ? builtins.currentSystem
}: let
  inherit (pkgs) stdenv callPackage;
  inherit (stdenv) mkDerivation;

  # android-size-analyzer = mkDerivation rec {
  #   pname = "android-size-analyzer";
  #   version = "0.4.0";
  #   src = fetchTarball "https://github.com/android/size-analyzer/releases/download/v${version}/analyzer.tar";
  #   buildInputs = [ jre_minimal ];
  #   unpackPhase = "true"; #skip
  #   # TODO: where to put those executable .jar ??
  #   installPhase = ''
  #     install -m755 -D $src/bin/analyzer.jar $out/bin/${pname}.jar
  #   '';
  # };

  graphics = callPackage (
    fetchTarball "https://github.com/guibou/nixGL/archive/master.tar.gz"
  ) {};

in
  with pkgs;
  mkShell {
    buildInputs = with graphics;
      [ nixGLDefault godot ];
  }
