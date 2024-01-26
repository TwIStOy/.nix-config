{
  config,
  lib,
  pkgs,
  ...
}: let
  programs = lib.makeBinPath [
    pkgs.nodePackages.nodejs
  ];
in {
  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "736dc4414110934547727f558f85f477950ebbe1";
    };
    recursive = true;
    onChange = "${pkgs.writeShellScript "dotvim-post-install" ''
      echo "Running post-install script"
      export PATH=$PATH:${programs}
      cd ${config.home.homeDirectory}/.local/share/dotvim
      npm ci
      npm run build
    ''}";
  };
}
