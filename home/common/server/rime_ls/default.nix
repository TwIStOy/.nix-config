{
  lib,
  pkgs,
  nur-hawtian,
  ...
}: let
  isDarwin = lib.strings.hasSuffix "darwin" pkgs.system;
in {
  home.packages = [
    nur-hawtian.packages.${pkgs.system}.rime-ls
  ];
  # xdg.configFile."ibus/rime/" = {
  #   source = ./files;
  #   recursive = true;
  # };
}
// (
  if isDarwin
  then {
    home.file."Library/Rime" = {
      enable = true;
      recursive = true;
      source = ./files;
    };
  }
  else {
    xdg.configFile."ibus/rime" = {
      source = ./files;
      recursive = true;
    };
  }
)

