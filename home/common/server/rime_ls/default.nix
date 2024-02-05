{
  lib,
  pkgs,
  system,
  nur-hawtian,
  ...
}: let
  isDarwin = lib.strings.hasSuffix "darwin" system;
in
  {
    home.packages = [
      nur-hawtian.packages.${pkgs.system}.rime-ls
    ];
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
