{
  config,
  lib,
  pkgs,
  ...
}:
let
  programs = lib.makeBinPath [
    pkgs.nodePackages.nodejs
  ];
in
{
  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "eee6088c698faccbffe60b6afe5b30c4c5e3bd33";
    };
    recursive = true;
    onChange = "${pkgs.writeShellScript "dotvim-post-install" ''
      echo "Running post-install script"
      export PATH=$PATH:${programs}
      npm install
      npm run build
    ''}";
  };
}