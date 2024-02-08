{
  lib,
  pkgs,
  system,
  nur-hawtian,
  ...
}: let
  isDarwin = lib.strings.hasSuffix "darwin" system;
in {
  home.packages = [
    nur-hawtian.packages.${pkgs.system}.rime-ls
  ];

  home.file =
    if isDarwin
    then {
      "Library/Rime" = {
        enable = true;
        recursive = true;
        source = ./files;
      };
    }
    else {};

  xdg.dataFile.rime-ls-files = {
    source = ./files;
    recursive = true;
  };

  xdg.configFile =
    if isDarwin
    then {}
    else {
      "ibus/rime" = {
        source = ./files;
        recursive = true;
      };
    };
}
