{ pkgs ? import <nixpkgs> {}
, system ? builtins.currentSystem
}: let
  inherit (pkgs) stdenv callPackage;
  inherit (stdenv) mkDerivation;
  inherit (builtins) getEnv;

  shared = callPackage ./share.nix {};

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

  # TODO: pin version
  graphics = callPackage (
    fetchTarball "https://github.com/guibou/nixGL/archive/master.tar.gz"
  ) {};

  ROOT_PROJECT = toString ./.;
in
  with pkgs;
  mkShell rec {
    buildInputs = with graphics;
      [ nixGLDefault godot ]
      ++ shared.libs
      # ++ [ openssl ] # TODO: generate encryption key if project.gdkey is missing
    ;
    # TODO: set `NIX_CONFIG = "extra-sandbox-paths = XDG_CACHE_HOME"` when nix v2.4 hit stable release
    inherit (shared.env) XDG_CACHE_HOME;
    shellHook = ''
      mkdir -m777 -p ${shared.cache.scons}
    '';
  }
