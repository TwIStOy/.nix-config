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
  ];

  xdg.configFile."nvim/init.lua" = {
    text = ''
      vim.loader.enable()

      local dotpath = "${config.home.homeDirectory}/.local/share/dotvim"
      vim.api.nvim_command("set runtimepath+=" .. dotpath)

      require("ht.init")
    '';
  };

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # search all the plugins using https://search.nixos.org/packages
      telescope-fzf-native-nvim
    ];
  };

  xdg.dataFile."dotvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/TwIStOy/dotvim.git";
      rev = "38eff15c2859cfeb0c8ed22f188f627461ed71e8";
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
