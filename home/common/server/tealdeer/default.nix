{
  pkgs,
  lib,
  system,
  ...
}: let
  settingsFormat = pkgs.formats.toml {};
  configFile = settingsFormat.generate "config.toml" {
    updates.auto_update = true;
  };
  isDarwin = lib.strings.hasSuffix "darwin" system;
in
  {
    home.packages = with pkgs; [
      tealdeer
    ];
  }
  // (
    if isDarwin
    then {
      home.file."Library/Application Support/tealdeer/config.toml".source = configFile;
    }
    else {
      xdg.configFile."tealdeer/config.toml".source = configFile;
    }
  )
