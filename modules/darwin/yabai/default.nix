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

  launchd.daemons.yabai-sa = {
    # https://github.com/koekeishiya/yabai/issues/1287
    script = lib.mkForce ''
      echo "skip it"
    '';
  };
}
