# TODO: support custom.py
{ godot }: let

  # https://github.com/Calinou/godot-size-benchmarks/blob/master/src/godot_size_benchmarks.nim#L43-L69
  picoBuild = ''
    module_bmp_enabled=no
    module_bullet_enabled=no
    module_csg_enabled=no
    module_dds_enabled=no
    module_enet_enabled=no
    module_etc_enabled=no
    module_gdnative_enabled=no
    module_gridmap_enabled=no
    module_hdr_enabled=no
    module_mbedtls_enabled=no
    module_mobile_vr_enabled=no
    module_opus_enabled=no
    module_pvr_enabled=no
    module_recast_enabled=no
    module_regex_enabled=no
    module_squish_enabled=no
    module_tga_enabled=no
    module_thekla_unwrap_enabled=no
    module_theora_enabled=no
    module_tinyexr_enabled=no
    module_vorbis_enabled=no
    module_webm_enabled=no
    module_websocket_enabled=no
  '';

  # Just to make compilation faster only for testing purpose
  nothingnessBuild = ''
    deprecated=no
    minizip=no
    module_arkit_enabled=no
    module_bmp_enabled=no
    module_bullet_enabled=no
    module_camera_enabled=no
    module_csg_enabled=no
    module_dds_enabled=no
    module_enet_enabled=no
    module_etc_enabled=no
    module_freetype_enabled=no
    module_gdnative_enabled=no
    module_gdnavigation_enabled=no
    module_gdscript_enabled=no
    module_gridmap_enabled=no
    module_hdr_enabled=no
    module_jpg_enabled=no
    module_jsonrpc_enabled=no
    module_mbedtls_enabled=no
    module_mobile_vr_enabled=no
    module_ogg_enabled=no
    module_opensimplex_enabled=no
    module_opus_enabled=no
    module_regex_enabled=no
    module_stb_vorbis_enabled=no
    module_tga_enabled=no
    module_theora_enabled=no
    module_tinyexr_enabled=no
    module_upnp_enabled=no
    module_visual_script_enabled=no
    module_vorbis_enabled=no
    module_webm_enabled=no
    module_webp_enabled=no
  '';

in
  # nix-build godot.nix
godot.overrideAttrs {
  sconsFlags = nothingnessBuild + ''
    optimize=size target=release
    platform=x11 use_llvm=yes
    tools=no disable_advanced_gui=yes
    disable_3d=yes
    module_mono_enabled=no
  ''; # Let's see if 👆 support multi-line

  # What is this?
  # preConfigure = ''
  #   sconsFlags+=" ${lib.concatStringsSep " " (lib.mapAttrsToList (k: v: "${k}=${builtins.toJSON v}") options)}"
  # '';
}
