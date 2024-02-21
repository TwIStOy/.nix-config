{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  nur-hawtian,
  ...
}: let
  programs = lib.makeBinPath [
    pkgs.nodePackages.nodejs
  ];

  dotpath = "${config.home.homeDirectory}/.local/share/dotvim";
  user-dotpath = "${config.home.homeDirectory}/.dotvim";

  plugins = {
    telescope-fzf-native-nvim = pkgs-unstable.vimPlugins.telescope-fzf-native-nvim;
    gh-actions-nvim = nur-hawtian.packages.${pkgs.system}.vimPlugins.gh-actions-nvim;
  };

  injectPluginDirs =
    builtins.foldl' (acc: x: acc + "\n" + x + ",") "" (lib.mapAttrsToList (name: pkg: "[\"${name}\"] = \"${pkg}\"") plugins);

  init-lua = dpath: ''
    vim.loader.enable()

    local dotpath = "${dpath}"
    vim.api.nvim_command("set runtimepath+=" .. dotpath)
    _G["nix_plugins"] = {
      ${injectPluginDirs}
    }

    require("ht.init")
  '';
in {
  home.packages = with pkgs; [
    python3.pkgs.pynvim
    nodePackages.neovim
    tree-sitter
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = builtins.attrValues plugins;
  };

  xdg.configFile."nvim/init.lua" = {
    text = init-lua dotpath;
  };

  xdg.configFile."nvim/init-user.lua" = {
    text = init-lua user-dotpath;
  };

  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "520bebf59dadd872e9c5132733408da2c84f8d69";
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
