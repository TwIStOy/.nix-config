{pkgs, ...}: {
  home.packages = with pkgs; [
    nodePackages.pyright # python language server

    (python3.withPackages (ps: with ps; [
      ruff-lsp
      black # python formatter

      jupyter
      ipython
      pandas
      requests
      pyquery
      pyyaml
      
      setuptools
      qrcode
      lxml
      psutil
      pip
    ]))
  ];
}
