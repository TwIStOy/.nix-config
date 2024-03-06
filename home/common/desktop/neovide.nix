{
  pkgs,
  pkgs-unstable,
  system,
  lib,
  ...
}: let
  settingsFormat = pkgs.formats.toml {};
  isDarwin = lib.strings.hasSuffix "darwin" system;
in {
  suits.neovide = {
    enable = true;
    package = pkgs-unstable.neovide;
    settings = {
      maximized = false;
      srgb = true;
      idle = true;
      neovim-bin = pkgs.neovim-nightly;
      frame = "transparent";
    };
    extraSettings = {
      font = {
        normal = {family = "MonoLisa Nerd Font";};
        bold = "MonaspiceKr Nerd Font Mono";
        bold_italic = "MonaspiceKr Nerd Font Mono";
        size = 20;
        features."MonoLisa Nerd Font" = ["+ss11" "+zero" "-calt" "+ss10" "+ss02" "+ss17" "+ss13" "+ss04"];
      };
    };
  };
}
