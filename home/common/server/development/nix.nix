{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    nixd
    statix
    deadnix
    alejandra
    nix-output-monitor

    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
  ];
}
