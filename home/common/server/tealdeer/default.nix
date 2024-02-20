{
  pkgs,
  lib,
  ...
}: let
  settingsFormat = pkgs.formats.toml {};
  configFile = settingsFormat.generate "config.toml" {
    updates.auto_update = true;
  };
in
  {
    home.packages = with pkgs; [
      tealdeer
    ];
  }
  // lib.attrsets.optionalAttrs (!pkgs.stdenv.isDarwin) {
    xdg.configFile."tealdeer/config.toml".source = configFile;
  }
  // lib.attrsets.optionalAttrs pkgs.stdenv.isDarwin {
    home.file."Library/Application Support/tealdeer/config.toml".source = configFile;
  }
