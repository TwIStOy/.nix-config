{pkgs, ...}: let
  build-tools = with pkgs; [
    gcc
    binutils
    gnumake
    ninja
  ];

  cpp-tools = with pkgs; [
    gcc
    gdb
    cmake
    cmake-language-server
    clang-tools
  ];

  nixpkgs-tools = with pkgs; [
    nil
    nixd
    statix
    deadnix
    alejandra

    nixpkgs-fmt
    nixpkgs-lint
    nixpkgs-review
  ];

  nodejs-tools = with pkgs; [
    nodePackages.nodejs
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier # common code formatter
  ];

  rust-tools = with pkgs; [
    rust-analyzer
    cargo
    rustc
    rustfmt
  ];

  python-tools = with pkgs; [
    nodePackages.pyright # python language server
    (python311.withPackages (
      ps:
        with ps; [
          ruff-lsp
          black # python formatter

          jupyter
          ipython
          pandas
          requests
          pyquery
          pyyaml

          ## emacs's lsp-bridge dependenciesge
          epc
          orjson
          sexpdata
          six
          setuptools
          paramiko
          rapidfuzz
        ]
    ))
  ];

  golang-tools = with pkgs; [
    # golang
    go
    gotools
    gopls
  ];

  lua-tools = with pkgs; [
    # lua
    stylua
    lua-language-server
  ];

  others = with pkgs; [
    # Others
    taplo # TOML language server / formatter / validator
  ];
in {
  home.packages =
    build-tools
    ++ cpp-tools
    ++ nixpkgs-tools
    ++ nodejs-tools
    ++ rust-tools
    ++ python-tools
    ++ golang-tools
    ++ lua-tools
    ++ others;
}
