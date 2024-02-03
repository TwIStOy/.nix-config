{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };
      git_branch = {
        symbol = " ";
        ignore_branches = ["master" "main"];
      };
      git_metrics = {
        disabled = false;
        ignore_submodules = true;
      };
    };
  };
}
