{
  config,
  lib,
  username,
  pkgs-unstable,
  ...
}: let
  homeDir = config.users.users."${username}".home;
in {
  services.yabai = {
    enable = true;
    package = pkgs-unstable.yabai;
    enableScriptingAddition = true;
    extraConfig = builtins.readFile ./yabairc;
  };

  launchd.user.agents.yabai.serviceConfig = {
    StandardErrorPath = "${homeDir}/Library/Logs/yabai.stderr.log";
    StandardOutPath = "${homeDir}/Library/Logs/yabai.stdout.log";
  };
}