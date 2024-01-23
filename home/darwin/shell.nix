{pkgs, lib, osConfig, ...}: let
  envExtra = ''
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
    source "$HOME/.cargo/env"
  '';
in {
  programs.bash = {
    enable = true;
    bashrcExtra = envExtra;
  };
  programs.zsh = {
    enable = true;
    inherit envExtra;
  };
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting
    '';

    plugins = [
      {
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "3ee95536106c11073d6ff466c1681cde31001383";
          sha256 = "sha256-vyW/X2lLjsieMpP9Wi2bZPjReaZBkqUbkh15zOi8T4Y=";
        };
      }
    ];
  };

  # https://github.com/LnL7/nix-darwin/issues/122
  programs.fish.loginShellInit =
    let
      # This naive quoting is good enough in this case. There shouldn't be any
      # double quotes in the input string, and it needs to be double quoted in case
      # it contains a space (which is unlikely!)
      dquote = str: "\"" + str + "\"";

      makeBinPathList = map (path: path + "/bin");
    in ''
      fish_add_path --move --prepend --path ${lib.concatMapStringsSep " " dquote (makeBinPathList osConfig.environment.profiles)}
      set fish_user_paths $fish_user_paths
    '';
}
