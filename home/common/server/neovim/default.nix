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
    vimPlugins.telescope-fzf-native-nvim
    tree-sitter
  ];

  xdg.configFile."nvim/init.lua" = {
    text = ''
      vim.loader.enable()

      local dotpath = "${config.home.homeDirectory}/.local/share/dotvim"
      vim.api.nvim_command("set runtimepath+=" .. dotpath)
      _G["nix_plugins"] = {
        ["telescope-fzf-native-nvim"] = "${pkgs.vimPlugins.telescope-fzf-native-nvim}"
      }

      require("ht.init")
    '';
  };

  xdg.configFile."nvim/init-user.lua" = {
    text = ''
      vim.loader.enable()

      local dotpath = vim.fn.expand("$HOME") .. "/.dotvim"
      vim.api.nvim_command("set runtimepath+=" .. dotpath)
      _G["nix_plugins"] = {
        ["telescope-fzf-native-nvim"] = "${pkgs.vimPlugins.telescope-fzf-native-nvim}"
      }

      require("ht.init")
    '';
  };

  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "53042ff1c7ade5d21bccb2b2b8be999b3f71c62e";
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
