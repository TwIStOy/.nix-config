{
  pkgs,
  pkgs-unstable,
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

  maple-font = pkgs.stdenv.mkDerivation rec {
    name = "maple-font";
    version = "v7.0-beta7";
    src = builtins.fetchurl {
      url = "https://github.com/subframe7536/maple-font/releases/download/${version}/nerdfont.zip";
      sha256 = "1nr7p8x1s3hli0s8r67agpd607nlcjd206qx1l0p7bqd8pcy8cg9";
    };
    nativeBuildInputs = with pkgs; [unzip];
    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      install -Dm64 *.ttf -t $out/share/fonts/truetype

      runHook postInstall
    '';
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
      maple-font

      pkgs.monaspace
      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/data/fonts/nerdfonts/shas.nix
      (pkgs-unstable.nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
          # Characters
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
          "Monaspace"
        ];
      })
    ];
  };
}
