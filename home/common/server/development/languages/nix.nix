{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    statix
    deadnix
    alejandra
    nix-output-monitor

    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
  ];
}
