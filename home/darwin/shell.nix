let
  envExtra = ''
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
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