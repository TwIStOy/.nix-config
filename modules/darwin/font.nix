{
  pkgs,
  secrets-hawtian,
  lib,
  ...
}: let
  monolisa = pkgs.stdenv.mkDerivation {
    name = "monolisa";
    version = "2.012";
    src = "${secrets-hawtian}/fonts/";

    installPhase = ''
      runHook preInstall

      install -Dm644 *.ttf -t $out/share/fonts/truetype

      runHook postInstall
    '';

    meta = {
      description = "Monolisa font";
      platforms = lib.platforms.all;
    };
  };
in {
  fonts = {
    # will be removed after this PR is merged:
    #   https://github.com/LnL7/nix-darwin/pull/754
    fontDir.enable = true;

    # will change to `fonts.packages` after this PR is merged:
    #   https://github.com/LnL7/nix-darwin/pull/754
    fonts = [
      monolisa

      pkgs.monaspace
      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/data/fonts/nerdfonts/shas.nix
      (pkgs.nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
          # Characters
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}
