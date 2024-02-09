{
  pkgs,
  lib,
  system,
  ...
}: let
  isDarwin = lib.strings.hasSuffix "darwin" system;
in {
  home.packages =
    if isDarwin
    then
      with pkgs; [
        dart
        cocoapods
      ]
    else
      with pkgs; [
        flutter
      ];
}
