import os

############### DON'T MODIFY ###############
LINKFLAGS = os.getenv("LINKFLAGS")

use_llvm = "yes"
use_lld = "yes"
tools = "no"
############### 👆👆👆👆👆👆 ###############

target = "debug"
# production = "yes"
# use_lto = "yes"
# use_thinlto = "yes"
extra_suffix = "nofeat"

platform = "x11"
arch = "x64"

deprecated = "no"
minizip = "no"
use_static_cpp = "no"
execinfo = "no"
gdscript = "no"

# Linux
pulseaudio = "no"
udev = "no"
xaudio2 = "no"
touch = "no"

disable_3d = "yes"
disable_advanced_gui = "yes"
no_editor_splash = "yes"

builtin_bullet = "no"
builtin_certs = "no"
builtin_enet = "no"
builtin_freetype = "no"
builtin_libogg = "no"
builtin_libpng = "no"
builtin_libtheora = "no"
builtin_libvorbis = "no"
builtin_libvpx = "no"
builtin_libwebp = "no"
# builtin_wslay = "no"     # not in <nixpkgs>
# builtin_squish = "no"    # not in <nixpkgs>
builtin_mbedtls = "no"     # in <nixpkgs> but no .pc file
builtin_miniupnpc = "no"   # in <nixpkgs> but no .pc file
builtin_opus = "no"
builtin_pcre2 = "no"
builtin_pcre2_with_jit = "no"
builtin_recast = "no"
builtin_xatlas = "no"
builtin_zlib = "no"
builtin_zstd = "no"

# module_freetype_enabled = "no" # must be set or it will compile error
module_arkit_enabled = "no"
module_assimp_enabled = "no"
module_bmp_enabled = "no"
module_bullet_enabled = "no"
module_camera_enabled = "no"
module_csg_enabled = "no"
module_cvtt_enabled = "no"
module_dds_enabled = "no"
module_enet_enabled = "no"
module_etc_enabled = "no"
module_gdnative_enabled = "no"
module_gdscript_enabled = "no"
module_gridmap_enabled = "no"
module_hdr_enabled = "no"
module_jpg_enabled = "no"
module_jsonrpc_enabled = "no"
module_mbedtls_enabled = "no"
module_mobile_vr_enabled = "no"
module_mono_enabled = "no"
module_ogg_enabled = "no"
module_opensimplex_enabled = "no"
module_opus_enabled = "no"
module_pvr_enabled = "no"
module_recast_enabled = "no"
module_regex_enabled = "no"
module_squish_enabled = "no"
module_stb_vorbis_enabled = "no"
module_svg_enabled = "no"
module_tga_enabled = "no"
module_theora_enabled = "no"
module_tinyexr_enabled = "no"
module_upnp_enabled = "no"
module_vhacd_enabled = "no"
module_visual_script_enabled = "no"
module_vorbis_enabled = "no"
module_webm_enabled = "no"
module_webp_enabled = "no"
module_webrtc_enabled = "no"
module_websocket_enabled = "no"
module_xatlas_unwrap_enabled = "no"

