{
  lib,
  pkgs-unstable,
  ...
}: let
  yazi-plugins = [
    "smart-enter.yazi/init.lua"
  ];

  add-plugin = plugin: {
    "yazi/plugins/${plugin}".text =
      builtins.readFile ./plugins/${plugin};
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
      manager = {
        keymap = [
          {
            on = ["l"];
            exec = "plugin --sync smart-enter";
            desc = "Enter the child directory, or open the file";
          }
        ];
      };
    };
  };

  # plugins
  xdg.configFile = lib.attrsets.mergeAttrsList (
    (lib.lists.forEach yazi-plugins add-plugin)
    ++ [
      {"yazi/init.lua".text = builtins.readFile ./init.lua;}
    ]
  );
}
