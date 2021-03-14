{ pkgs ? import <nixpkgs> { inherit system; }
, system ? builtins.currentSystem
, profile ? ./custom.py
, cache ? true # TODO: if shared.cache.scons is writable in preBuild hook then true else false
}: let
  inherit (pkgs) stdenv godot nix-gitignore callPackage;

  shared = callPackage ./share.nix {};

  # hint(cache-build): https://leanprover.github.io/lean4/doc/make/nix.html
  export-template = godot.overrideAttrs (
    old: {
      pname = "my-godot-template"; # TODO: should be from project.godot
      buildInputs = with pkgs; [ clang lld ]
      ++ shared.libs
      ++ old.buildInputs;
      sconsFlags = "profile=${profile}";
      preConfigure = "";
      inherit (shared.env) XDG_CACHE_HOME; # TODO: should be from environment variable instead of hardcoded
      preBuild = if cache then ''
        export SCONS_CACHE=${shared.cache.scons}
        export SCONS_CACHE_LIMIT=5000
      '' else "";
    }
  );
in
  with stdenv;
  # mkDerivation {
  #   name = "my-project"; # TODO: get name from project.godot
  #   src = gitignoreSourcePure patterns ./. ++ [];
  #   buildInputs = [ export-template openssl binutils upx ];
  #   # TODO: make myGodot auto-build just like pkgs.autoconf
  #   # nativeBuildInputs = [ myGodot ];
  #   # unpackPhase = ''
  #   # '';
  #   SCONSFLAGS = "-j4";
  #   unpackPhase = ''
  #   '';
  #   configurePhase = ''
  #     if [ ! -f $src/godot.gdkey ]; then
  #       openssl enc -aes-256-cbc -k secret -P -md sha1 > $src/godot.gdkey
  #     fi
  #   '';
  #   SCRIPT_AES256_ENCRYPTION_KEY = (fromTOML ./godot.gdkey).key;
  #   buildPhase = ''
  #     objcopy --only-keep-debug result/godot result/godot.dbg
  #     strip result/godot
  #     upx --ultra-brute result/godot
  #   '';
  #   # dontBuild = true; # enable this if it only just printing something
  #   installPhase = ''
  #     ls > $out
  #     godot --export ${system} ${(fromTOML ./project.godot).name}
  #   '';
  # }
  export-template
