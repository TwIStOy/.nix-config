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
  home.packages = with pkgs; [
    neovim-nightly
    python3.pkgs.pynvim
    nodePackages.neovim
  ];

  xdg.configFile."nvim/init.lua" = {
    text = ''
      vim.loader.enable()

      local dotpath = "${config.home.homeDirectory}/.local/share/dotvim"
      vim.api.nvim_command("set runtimepath+=" .. dotpath)

      require("ht.init")
    '';
  };

  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "b3d38d1c0184e47a8506b77437ed6ecd2c926f17";
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
