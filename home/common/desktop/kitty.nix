{
  lib,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    theme = "Catppuccin-Mocha";
    settings = {
      font_family = "MonoLisa Light";
      bold_font = "MonoLisa SemiBold";
      italic_font = "MonoLisa Light Italic";
      bold_italic_font = "MonoLisa SemiBold Italic";
    };
  };
}
