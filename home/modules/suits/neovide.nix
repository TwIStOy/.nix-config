{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.suits.neovide;
  settingsFormat = pkgs.formats.toml {};
  genConfig = opts: settingsFormat.generate "config.toml" opts;
  neovideBin =
    if pkgs.stdenv.isDarwin
    then
      # https://github.com/neovide/neovide/issues/915
      "/Applications/Neovide.app/Contents/MacOS/neovide"
    else "neovide";
in {
  options.suits.neovide = {
    enable = lib.mkEnableOption "neovide";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.neovide;
      description = "neovide package to use";
    };

    settings = {
      frame = lib.mkOption {
        type = lib.types.enum ["transparent" "full" "none" "buttonless"];
        default = "full";
        description = ''
          full: The default, all decorations.
          none: No decorations at all. NOTE: Window cannot be moved nor resized after this.
          (macOS only) transparent: Transparent decorations including a transparent bar.
          (macOS only) buttonless: All decorations, but without quit, minimize or fullscreen buttons.
        '';
      };

      maximized = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Maximize the window on startup, while still having decorations and the status bar of your OS visible.
        '';
      };

      idle = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          With idle on (default), neovide won't render new frames when nothing is happening.
          With idle off (e.g. with --no-idle flag), neovide will constantly render new frames, even when nothing changed. This takes more power and CPU time, but can possibly help with frame timing issues.

        '';
      };

      srgb = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = ''
          Request sRGB support on the window. Neovide does not actually render with sRGB, but it's still enabled by default on Windows to work around neovim/neovim/issues/907. Other platforms should not need it, but if you encounter either startup crashes or wrong colors, you can try to swap the option. The command line parameter takes priority over the environment variable.

        '';
      };

      neovim-bin = lib.mkOption {
        type = lib.types.package;
        default = pkgs.neovim;
        description = ''
          Path to the neovim binary to use.
        '';
      };
    };

    extraSettings = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
      description = ''
        Extra settings to add to the config.toml file.
      '';
    };

    createRemoteHostWrappers = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = ''
        List of remote hosts to create wrappers for.
      '';
    };

    # Remove this option after https://github.com/NixOS/nixpkgs/issues/290611 is fixed
    skipPackage = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Skip the package installation.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = let
      mkNeovideWrapper = host:
        pkgs.writeShellScriptBin "neovide-${host}" ''
          #!/bin/bash
          ${neovideBin} --neovim-bin "$XDG_CONFIG_HOME/neovide/remote-hosts/${host}" $@
        '';
    in
      # neovideWrappers
      (lib.lists.forEach cfg.createRemoteHostWrappers mkNeovideWrapper)
      ++ (lib.lists.optional (!cfg.skipPackage) cfg.package)
      ++ (lib.lists.optional pkgs.stdenv.isDarwin (
        pkgs.writeShellScriptBin "neovide" ''
          #!/bin/bash
          ${neovideBin} $@
        ''
      ));

    xdg.configFile = let
      mkRemoteNvimBin = host: {
        "neovide/remote-hosts/${host}" = {
          source = pkgs.writeShellScript host ''
            #!/bin/bash
            ssh ${host} "bash -l -c \"nvim $@\""
          '';
          force = true;
          executable = true;
        };
      };
    in
      lib.mkMerge (
        [
          {
            "neovide/config.toml" = {
              source = genConfig ({
                  inherit (cfg.settings) maximized frame srgb idle;
                  neovim-bin = "${cfg.settings.neovim-bin}/bin/nvim";
                }
                // cfg.extraSettings);
              force = true;
            };
          }
        ]
        ++ (lib.lists.forEach cfg.createRemoteHostWrappers mkRemoteNvimBin)
      );
  };
}
