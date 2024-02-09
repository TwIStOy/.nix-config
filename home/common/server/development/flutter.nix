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
        cocoapods
      ]
    else
      with pkgs; [
        flutter
      ];
}
