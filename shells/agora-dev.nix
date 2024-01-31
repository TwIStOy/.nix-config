{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
  pkgs.mkShell {
    packages = with pkgs; [
      pkg-config
      gcc
    ];

    shellHook = ''
      echo "Agora-dev"
      exec fish
    '';
  }
