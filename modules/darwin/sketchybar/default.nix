{
  pkgs,
  pkgs-unstable,
  ...
}:
# let
#   sketchybar-app-font = pkgs.stdenv.mkDerivation rec {
#     pname = "sketchybar-app-font";
#     version = "v2.0.5";
#     src = builtins.fetchurl {
#       url = "https://github.com/kvndrsslr/sketchybar-app-font/releases/download/${version}/sketchybar-app-font.ttf";
#       sha256 = "006gfal3iaji572rsb6z5ysy7nyzk3vxsp18ihsm9hss58h5bwlx";
#     };
#     dontUnpack = true;
#     phases = ["installPhase"];
#
#     installPhase = ''
#       runHook preInstall
#
#       install -Dm64 *.ttf -t $out/share/fonts/truetype
#
#       runHook postInstall
#     '';
#   };
# in
{
  # fonts = {
  #   fonts = [
  #     sketchybar-app-font
  #   ];
  # };

  services.sketchybar = {
    enable = true;
    package = pkgs-unstable.sketchybar;
    extraPackages = with pkgs; [
      jq
    ];
    config = builtins.readFile ./sketchybarrc;
  };

  environment.etc = {
    "sketchybar/colors.sh" = {
      source = ./colors.sh;
    };
    "sketchybar/items" = {
      source = ./items;
    };
    "sketchybar/plugins" = {
      source = ./plugins;
    };
  };
}
