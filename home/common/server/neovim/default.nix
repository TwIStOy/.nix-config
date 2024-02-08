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
    python3.pkgs.pynvim
    nodePackages.neovim
    tree-sitter
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs; [
      vimPlugins.telescope-fzf-native-nvim
    ];
  };

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
      rev = "40d7db8a9ab207171344e8306cf5258ff6c7f05e";
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
