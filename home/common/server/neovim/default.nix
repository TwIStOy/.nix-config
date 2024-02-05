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
      rev = "5b5e4e4398398ed6f537f45bb61d326231873cf4";
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
