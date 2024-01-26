{
  pkgs,
  config,
  username,
  ...
}: {
  services.skhd = {
    enable = true;
    skhdConfig = builtins.readFile ./skhdrc;
  };

  # custom log path for debugging
  launchd.user.agents.skhd= let
    homeDir = config.users.users."${username}".home;
  in {
    path = [
      "${pkgs.skhd}/bin"
      "${pkgs.yabai}/bin"
      "${pkgs.jq}/bin"
      # $HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/homebrew/bin
    ];
    serviceConfig = {
      StandardErrorPath = "${homeDir}/Library/Logs/skhd.stderr.log";
      StandardOutPath = "${homeDir}/Library/Logs/skhd.stdout.log";
    };
  };
}