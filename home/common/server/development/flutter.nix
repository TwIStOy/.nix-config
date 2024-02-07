{
  pkgs,
  lib,
  system,
  ...
}: let
  isDarwin = lib.strings.hasSuffix "darwin" system;
in {
  home.packages =
    (with pkgs; [
      flutter
    ])
    ++ (
      if isDarwin
      then
        with pkgs; [
          cocoapods
        ]
      else []
    );
}
