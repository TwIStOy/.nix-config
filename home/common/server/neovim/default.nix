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

  plugins =
    {
      gh-actions-nvim = nur-hawtian.packages.${pkgs.system}.vimPlugins.gh-actions-nvim;
    }
    // (with pkgs-unstable; {
      telescope-fzf-native-nvim = vimPlugins.telescope-fzf-native-nvim;
      markdown-preview-nvim = vimPlugins.markdown-preview-nvim;
    });

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
      rev = "554ca47f6c6f390334ebd5138144886ffb5eecf0";
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
