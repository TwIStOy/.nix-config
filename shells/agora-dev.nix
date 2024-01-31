{
  inputs,
  system,
  ...
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
  pkgs.mkShell rec {
    buildInputs = with pkgs; [
      just
      stdenv.cc.cc
      cmake
      python3
    ];

    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

    shellHook = ''
      echo "Agora-dev"
      exec fish
    '';
  }
