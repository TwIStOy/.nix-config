{
  pkgs,
  nur-hawtian,
  ...
}: {
  home.packages = [
    nur-hawtian.packages.${pkgs.system}.rime-ls
  ];

  xdg.dataFile.rime-ls-files = {
    source = ./files;
    recursive = true;
    force = true;
  };
}
