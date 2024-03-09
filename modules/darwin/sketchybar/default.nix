{
  pkgs,
  pkgs-unstable,
  ...
}: let
  sketchybar-git = builtins.fetchTarball {
    url = "https://github.com/FelixKratz/SketchyBar/archive/refs/tags/v2.20.1.tar.gz";
    sha256 = "05m6drmilkcsr7xxmaj49rc624gg4rl5wh3p979axkicfhkkhakp";
  };
in {
  services.sketchybar = {
    enable = true;
    package = pkgs-unstable.sketchybar;
    extraPackages = with pkgs; [
      jq
    ];
    config = builtins.readFile ./sketchybarrc;
  };

  environment.etc = {
    "sketchybar/git" = {
      source = sketchybar-git;
    };
  };
}
