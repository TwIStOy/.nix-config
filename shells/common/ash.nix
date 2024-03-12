{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  inherit (inputs) devenv;
  inherit (pkgs) stdenv;
  inherit (pkgs) lib;
in
  devenv.lib.mkShell {
    inherit inputs pkgs;

    modules = [
      (
        {pkgs, ...}: {
          packages =
            (with pkgs; [
              pkg-config
              libiconv
            ])
            ++ lib.lists.optionals stdenv.isDarwin [
              pkgs.darwin.Security
              pkgs.darwin.CF
            ];

          languages.rust.enable = true;
        }
      )
    ];
  }
