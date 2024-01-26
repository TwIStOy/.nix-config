{...}: {
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
    };
  };
}
