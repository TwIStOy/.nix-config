{
  pkgs,
  config,
  username,
  ...
}: {
  services.skhd = {
    enable = false;
    skhdConfig = builtins.readFile ./skhdrc;
  };

  # custom log path for debugging
  launchd.user.agents.skhd = let
    homeDir = config.users.users."${username}".home;
  in {
    # https://github.com/LnL7/nix-darwin/issues/406
    path = [
      "${pkgs.skhd}/bin"
      # "${pkgs.yabai}/bin"
      "${pkgs.jq}/bin"
    ];
    serviceConfig = {
      StandardErrorPath = "${homeDir}/Library/Logs/skhd.stderr.log";
      StandardOutPath = "${homeDir}/Library/Logs/skhd.stdout.log";
    };
  };
}
