{
  pkgs,
  nur-hawtian,
  ...
}: let
  rimeConfigFolder =
    if pkgs.stdenv.isDarwin
    then "Library/Rime/"
    else "ibus/rime/";
in
  {
    home.packages = [
      nur-hawtian.packages.${pkgs.system}.rime-ls
    ];
  }
  // (
    if pkgs.stdenv.isDarwin
    then {
      home.file."${rimeConfigFolder}" = {
        enable = true;
        recursive = true;
        source = ./files;
      };
    }
    else {
      xdg.configFile."ibus/rime/" = {
        source = ./files;
        recursive = true;
      };
    }
  )
