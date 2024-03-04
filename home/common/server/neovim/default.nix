{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  nur-hawtian,
  ...
}: let
  user-dotpath = "${config.home.homeDirectory}/.dotvim";

  plugins =
    {
      gh-actions-nvim = nur-hawtian.packages.${pkgs.system}.vimPlugins.gh-actions-nvim;
    }
    // (with pkgs-unstable; {
      telescope-fzf-native-nvim = vimPlugins.telescope-fzf-native-nvim;
      markdown-preview-nvim = vimPlugins.markdown-preview-nvim;
    });

  bins = with pkgs; {
    fzf = fzf;
    stylua = stylua;
    lua-language-server = lua-language-server;
  };

  nixAwareNvimConfig = pkgs.stdenv.mkDerivation {
    name = "nix-aware-nvim-config";

    buildInputs = lib.mapAttrsToList (_: pkg: pkg) plugins;

    phases = ["installPhase"];

    nixAwareNvimConfigJson =
      pkgs.writeText
      "nixAwareNvimConfig.json"
      (builtins.toJSON {
        pkgs = plugins;
        bin = lib.mapAttrs (name: pkg: "${pkg}/bin/${name}") bins;
      });

    installPhase = ''
      mkdir -p $out
      cp $nixAwareNvimConfigJson $out/nix-aware.json
    '';
  };

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
    nixAwareNvimConfig
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = builtins.attrValues plugins;
  };

  xdg.configFile = {
    "nvim/init-dora.lua" = {
      text = init-dora;
      force = true;
    };

    "nvim/init.lua" = {
      text = init-dora;
      force = true;
    };

    "nvim/nix-aware.json" = {
      source = "${nixAwareNvimConfig}/nix-aware.json";
      force = true;
    };
  };
}
