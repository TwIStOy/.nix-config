{
  lib,
  mylib,
  pkgs-unstable,
  ...
}: let
  yazi-plugins = [
    "smart-enter.yazi/init.lua"
  ];

  add-plugin = plugin: {
    "yazi/plugins/${plugin}".text =
      builtins.readFile "./plugins/${plugin}";
  };
in {
  programs.yazi = {
    enable = true;
    package = pkgs-unstable.yazi;
    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = {
      log = {
        enabled = true;
      };
      opener = {
        text = [
          {
            exec = "nvim \"$@\"";
            block = true;
          }
        ];
      };
      open = {
        rules = [
          {
            name = "*.json";
            use = "text";
          }
          {
            name = "*.cpp";
            use = "text";
          }
          {
            name = "*.lua";
            use = "text";
          }
          {
            name = "*.toml";
            use = "text";
          }
          {
            name = "*.yaml";
            use = "text";
          }
          {
            name = "*.c";
            use = "text";
          }
          {
            name = "*.rs";
            use = "text";
          }
          {
            name = "*.ts";
            use = "text";
          }
          {
            name = "*.nix";
            use = "text";
          }
        ];
      };
    };
  };

  # plugins
  xdg.configFile = mylib.mergeAttrsList (lib.lists.foreach yazi-plugins add-plugin);
}
