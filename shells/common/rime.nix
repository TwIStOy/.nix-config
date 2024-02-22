{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  devenv = inputs.devenv;
in
  devenv.lib.mkShell {
    inherit inputs pkgs;

    modules = [
      (
        {pkgs, ...}: {
          packages = with pkgs;
            [
              librime
            ]
            ++ (
              lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
                frameworks.Security
              ])
            );

          languages.rust.enable = true;
        }
      )
    ];
  }
