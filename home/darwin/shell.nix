{
  pkgs,
  lib,
  osConfig,
  ...
}: let
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
}
