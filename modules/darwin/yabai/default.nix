{
  config,
  lib,
  username,
  pkgs,
  pkgs-unstable,
  ...
}: let
  homeDir = config.users.users."${username}".home;
in {
  services.yabai = {
    enable = true;
    package = pkgs-unstable.yabai;
    # temporary workaround for https://github.com/ryan4yin/nix-config/issues/51
    # package = pkgs-unstable.yabai.overrideAttrs (oldAttrs: rec {
    #   version = "6.0.7";
    #   env = {
    #     # silence service.h error
    #     NIX_CFLAGS_COMPILE = "-Wno-implicit-function-declaration";
    #   };
    #   src =
    #     if pkgs.stdenv.isAarch64
    #     then
    #       (pkgs.fetchzip {
    #         url = "https://github.com/koekeishiya/yabai/releases/download/v${version}/yabai-v${version}.tar.gz";
    #         hash = "sha256-hZMBXSCiTlx/37jt2yLquCQ8AZ2LS3heIFPKolLub1c=";
    #       })
    #     else
    #       (pkgs.fetchFromGitHub {
    #         owner = "koekeishiya";
    #         repo = "yabai";
    #         rev = "v${version}";
    #         hash = "sha256-vWL2KA+Rhj78I2J1kGItJK+OdvhVo1ts0NoOHIK65Hg=";
    #       });
    # });

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
