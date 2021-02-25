{ pkgs ? import <nixpkgs> {} }:

let
#godot = import ./default.nix { inherit pkgsi; };
godot = pkgs.godot;

# https://nixos.org/manual/nixpkgs/stable/#sec-pkg-overrideAttrs
myGodot = godot.overrideAttrs (oldAttrs: rec {
  pname = "godot-server";
  sconsFlags = "target=release platform=server tools=no";
  installPhase = ''
    mkdir -p "$out/bin"
    cp bin/godot_server.* $out/bin/godot-server
    mkdir "$dev"
    cp -r modules/gdnative/include $dev
    mkdir -p "$man/share/man/man6"
    cp misc/dist/linux/godot.6 "$man/share/man/man6/"
  '';
});

in with pkgs;

mkShell {

}

