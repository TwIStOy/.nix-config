{
  pkgs,
  nur-hawtian,
  ...
}: let
  build-tools = with pkgs; [
    gcc
    gnumake
    ninja
    pkg-config
  ];

  cpp-tools =
    (with pkgs; [
      gcc
      cmake
      cmake-language-server
      llvmPackages_17.clang-unwrapped
    ])
    ++ [
      nur-hawtian.packages.${pkgs.system}.gersemi
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
    python3
    python3.pkgs.ruff-lsp
    python3.pkgs.black # python formatter

    python3.pkgs.jupyter
    python3.pkgs.ipython
    python3.pkgs.pandas
    python3.pkgs.requests
    python3.pkgs.pyquery
    python3.pkgs.pyyaml

    python3.pkgs.setuptools
    python3.pkgs.qrcode
    python3.pkgs.lxml
    python3.pkgs.psutil
    python3.pkgs.pip
  ];

  golang-tools = with pkgs; [
    go
    gotools
    gopls
  ];

  lua-tools = with pkgs; [
    luajit
    stylua
    lua-language-server
  ];

  others = with pkgs;
    [
      # Others
      taplo # TOML language server / formatter / validator

      protobuf
    ]
    ++ [
      nur-hawtian.packages.${pkgs.system}.rime-ls
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
