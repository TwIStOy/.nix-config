{
  inputs,
  system,
}: let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
  pkgs.mkShell {
    packages = with pkgs; [
      openssl
      fish
      pkg-config
    ];
    shellHook = ''
      exec fish
    '';
  }
