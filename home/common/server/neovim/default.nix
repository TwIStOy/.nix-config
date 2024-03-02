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

  init-deprecated = ''
    vim.loader.enable()

    local dotpath = "${user-dotpath}"
    vim.api.nvim_command("set runtimepath+=" .. dotpath)
    _G["nix_plugins"] = {
      ${injectPluginDirs}
    }

    require("ht.init")
  '';

  init-dora = ''
    vim.loader.enable()
    local dotpath = "${user-dotpath}"
    vim.opt.rtp:prepend(dotpath)
    require("dotvim").setup()
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

  xdg.configFile = {
    "nvim/init-deprecated.lua" = {
      text = init-deprecated;
      force = true;
    };

    "nvim/init-dora.lua" = {
      text = init-dora;
      force = true;
    };

    "nvim/init.lua" = {
      text = init-dora;
      force = true;
    };
  };

  # xdg.dataFile."dotvim" = {
  #   source = builtins.fetchGit {
  #     url = "https://github.com/TwIStOy/dotvim.git";
  #     rev = "5885fb0103132005f83a07b87bf7c8bff081eb6a";
  #   };
  #   recursive = true;
  #   onChange = "${pkgs.writeShellScript "dotvim-post-install" ''
  #     echo "Running post-install script"
  #     export PATH=$PATH:${programs}
  #     cd ${config.home.homeDirectory}/.local/share/dotvim
  #     npm ci
  #     npm run build
  #   ''}";
  # };
}
