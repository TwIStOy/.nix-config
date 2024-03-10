{
  pkgs,
  pkgs-unstable,
  ...
}: {
  services.sketchybar = {
    enable = false;
    package = pkgs-unstable.sketchybar;
    extraPackages = with pkgs; [
      jq
    ];
    config = builtins.readFile ./sketchybarrc;
  };

  environment.etc = {
    "sketchybar/colors.sh" = {
      source = ./colors.sh;
    };
    "sketchybar/items" = {
      source = ./items;
    };
    "sketchybar/plugins" = {
      source = ./plugins;
    };
  };
}
