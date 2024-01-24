{pkgs, ...}: {
  home.packages = with pkgs; [
    cmake
    cmake-language-server
    gnumake

    gcc

    # nix
    nil
    nixd
    statix
    deadnix
    alejandra

    # js/ts
    nodePackages.nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server

    # rust
    rust-analyzer
    cargo
    rustc
    rustfmt
  ];
}
