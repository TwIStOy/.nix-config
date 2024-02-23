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
  home.packages =
    if !pkgs.stdenv.isDarwin
    then
      (with pkgs-unstable; [
        neovide
      ])
    else [];

  xdg.configFile."neovide/config.toml".source = settingsFormat.generate "config.toml" {
    vsync = true;
    maximized = false;
    srgb = true;
    idle = true;
    neovim-bin = "${pkgs.neovim-nightly}/bin/nvim";
    frame =
      if isDarwin
      then "transparent"
      else "full";

    font = {
      normal = {family = "MonoLisa Nerd Font";};
      bold = "MonaspiceKr Nerd Font Mono";
      bold_italic = "MonaspiceKr Nerd Font Mono";
      size = 22;
      features."MonoLisa Nerd Font" = ["+ss11" "+zero" "-calt" "+ss10" "+ss02" "+ss17" "+ss13" "+ss04"];
    };
  };
}
