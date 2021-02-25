{ pkgs ? import <nixpkgs> { inherit system; }
, system ? builtins.currentSystem
}: let
  #   start simple 🙂
  inherit (pkgs) godot nix-gitignore;

  myGodot = callPackage ./godot.nix {};
in
  with stdenv;
  mkDerivation {
    name = "my-project"; # TODO: get name from project.godot
    src = gitignoreSourcePure patterns ./.;
    buildInputs = [ myGodot ];
    # TODO: make myGodot auto-build just like pkgs.autoconf
    # nativeBuildInputs = [ myGodot ];
    dontBuild = true;
    # unpackPhase = ''
    # '';
    installPhase = ''
    '';
  }
