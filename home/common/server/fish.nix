{pkgs, ...}: {
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    set fish_greeting
  '';
  programs.fish.plugins = [
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
  programs.fish.shellAbbrs = {
    ll = "eza -l --icons -a --group-directories-first --git";
    glr = "git pull --rebase";
    gco = "git checkout";
    gst = "git status";
    gd = "git diff";
    glg = "git log --graph";
  };
}
