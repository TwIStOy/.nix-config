{pkgs, ...}: {
  home.packages = with pkgs; [
    cmake
    cmake-language-server
    gnumake

    gcc
    clang-tools

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
    nodePackages.prettier # common code formatter

    # rust
    rust-analyzer
    cargo
    rustc
    rustfmt

    # python
    nodePackages.pyright # python language server

    # golang
    go
    gotools
    gopls

    # lua
    stylua
    lua-language-server

    # Others
    taplo # TOML language server / formatter / validator
  ];
}
