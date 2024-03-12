{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
  inherit (inputs) devenv;
in
  devenv.lib.mkShell {
    inherit inputs pkgs;

    modules = [
      (
        {pkgs, ...}: {
          packages = with pkgs; [
            pkg-config
            libiconv
          ];
          languages.rust.enable = true;
        }
      )
    ];
  }
